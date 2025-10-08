clc; close all; clear;

%% === PARÂMETROS COMUNS ===
Fs = 1e5;                     % frequência de amostragem (100 kHz para resolver bem os espectros)
tmax = 5e-3;                  % duração do sinal [s]
t = 0:1/Fs:tmax;              % vetor tempo
N = length(t);
faxis = linspace(-Fs/2,Fs/2,N); % eixo de frequência para FFT

%% === DEFINA AQUI OS CENÁRIOS (coluna 1: [Ac fc Am fm ka]) ===
% Ac=amplitude portadora; fc=freq portadora; Am=amplitude modulante;
% fm=freq modulante; ka=sensibilidade (índice de modulação)
cenarios = {
    [1 10e3 0.2 1e3 0.5]      % portadora 10 kHz, modulante 1 kHz, baixa modulação
    [1 10e3 0.8 1e3 0.5]      % mesma portadora/modulante, modulação mais profunda
    [1 10e3 1.0 2e3 0.5]      % modulante 2 kHz
    [1 10e3 1.5 1e3 0.5]      % modulação exagerada (supermodulação)
};

%% === LOOP SOBRE CENÁRIOS ===
for idx = 1:size(cenarios,1)
    pars = cenarios{idx};
    Ac = pars(1); fc = pars(2);
    Am = pars(3); fm = pars(4);
    ka = pars(5);

    % === SINAIS NO TEMPO ===
    c = Ac*cos(2*pi*fc*t);            % portadora c(t)
    m = Am*cos(2*pi*fm*t);            % modulante m(t)
    s = (1 + ka*m).*c;                % sinal AM s(t)

    % === FFTs ===
    Cfft = fftshift(fft(c))/N;
    Mfft = fftshift(fft(m))/N;
    Sfft = fftshift(fft(s))/N;

    %% === PLOTS NO TEMPO ===
    figure('Name',sprintf('Tempo - Caso %d',idx));
    subplot(3,1,1);
    plot(t*1000,c,'-o','MarkerIndices',1:round(N/200):N);
    grid on; xlabel('Tempo [ms]'); ylabel('Amplitude [V]');
    title(sprintf('Portadora c(t) - Caso %d',idx));

    subplot(3,1,2);
    plot(t*1000,m,'-o','MarkerIndices',1:round(N/200):N);
    grid on; xlabel('Tempo [ms]'); ylabel('Amplitude [V]');
    title('Sinal modulante m(t)');

    subplot(3,1,3);
    plot(t*1000,s,'-o','MarkerIndices',1:round(N/200):N);
    grid on; xlabel('Tempo [ms]'); ylabel('Amplitude [V]');
    title(sprintf('Sinal modulado s(t) (ka=%.2f)',ka));

    %% === PLOTS NO DOMÍNIO DA FREQUÊNCIA ===
    figure('Name',sprintf('Espectros - Caso %d',idx));
    subplot(3,1,1);
    plot(faxis,abs(Cfft));
    grid on; xlabel('Frequência [Hz]'); ylabel('|C(f)|');
    title('Espectro da portadora');

    subplot(3,1,2);
    plot(faxis,abs(Mfft));
    grid on; xlabel('Frequência [Hz]'); ylabel('|M(f)|');
    title('Espectro do modulante');

    subplot(3,1,3);
    plot(faxis,abs(Sfft));
    grid on; xlabel('Frequência [Hz]'); ylabel('|S(f)|');
    title('Espectro do sinal AM');

    %% === CÁLCULO DO ÍNDICE DE MODULAÇÃO ===
    % índice de modulação m_ind = ka*Am
    m_ind = ka*Am;
    fprintf('Caso %d: fc=%.0f Hz, fm=%.0f Hz, ka=%.2f, Am=%.2f V -> índice m=%.2f\n',...
            idx,fc,fm,ka,Am,m_ind);
end
