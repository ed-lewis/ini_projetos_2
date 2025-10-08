clc;          % limpa janela de comando
close all;    % fecha todas as figuras
clear all;    % limpa todas as vari�veis do workspace

%% Defini��o das Vari�veis
f = 500;       % frequ�ncia do sinal senoidal
T = 1/f;       % per�odo do sinal senoidal
Fs = 8e3;      % frequ�ncia de amostragem
Ts = 1/Fs;     % per�odo de amostragem
N = round(30*T*Fs); % n�mero de amostras do sinal

%% Cria sinal senoidal com frequ�ncia f
n = 0: N-1;                  % vetor de tempo discreto (�ndice da amostra)
x = sin(2*pi*f*n/Fs);        % gera sinal senoidal

%% FFT transforma o sinal do dom�nio do tempo para o dom�nio da frequ�ncia
X = fft(x);        % espectro de 0 a +Fs
Xc = fftshift(X);  % espectro de -Fs/2 a +Fs/2
Xp = X(1:length(X)/2); % apenas as componentes positivas

%% Plota resultados
t = n/Fs;                        % eixo do tempo (segundos)
fc = linspace(-Fs/2, Fs/2, N);   % eixo de frequ�ncia [-Fs/2, Fs/2]
fp = linspace(0, Fs/2, N/2);     % eixo de frequ�ncia [0, Fs/2]
Xcn = abs(Xc)/(N);               % normaliza��o do espectro completo
Xpn = abs(Xp)/(N);               % normaliza��o do espectro positivo

% Primeira representa��o: apenas frequ�ncias positivas
subplot 211
plot(t(1:N/6),x(1:N/6));
grid on;
xlabel('Tempo [s]');
ylabel('Amplitude [V]');

subplot 212
plot(fp, Xpn);
grid on;
xlabel('Frequencia [Hz]');
ylabel('|X|');
axis([0 Fs/2 0 1.1*max(abs(Xpn))])

% Segunda representa��o: frequ�ncias positivas e negativas
figure
subplot 211
plot(t(1:N/6),x(1:N/6));
grid on;
xlabel('Tempo [s]');
ylabel('Amplitude [V]');

subplot 212
plot(fc, Xcn);
grid on;
xlabel('Frequencia [Hz]');
ylabel('|X|');
axis([-Fs/2 Fs/2 0 1.1*max(abs(Xcn))])
