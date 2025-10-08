clc; close all; clear;

%% === DEFINI��O DE PAR�MTROS ===
%%% === PAR�METROS COMUNS ===
Fs = 1e04;                  % frequ�ncia de amostragem 10 kHz
t = 0:1/(100*Fs):5e-3;           % tempo de 0 a 5 ms
ka = 0.5;                  % sensibilidade � amplitude

%% === DEFINI��O DE PAR�MTROS ===
%%% === PORTADORA ===
Ac = 2.5;                    % amplitude da portadora
fc = 10e3;                 % frequ�ncia da portadora 10kHz
c = Ac*cos(2*pi*fc*t);      % portadora c(t)

%% === DEFINI��O DE PAR�MTROS ===
%%% === MODULANTE ===
Am = 1;                    % amplitude do sinal modulante
fm = 1e3;                  % frequ�ncia do sinal modulante
m = Am*cos(2*pi*fm*t);      % modulante m(t)

%% === MODULA��O AM ===
s = (1 + ka*m).*c;          % sinal modulado s(t)

%% === PLOTS ===
figure;
subplot(3,1,1);
plot(t*1000,c,'-o','MarkerIndices',1:round(length(t)/100):length(t));
grid on;
xlabel('Tempo [ms]'); ylabel('Amplitude [V]');
title('Portadora c(t)');

subplot(3,1,2);
plot(t*1000,m,'-o','MarkerIndices',1:round(length(t)/30):length(t));
grid on;
xlabel('Tempo [ms]'); ylabel('Amplitude [V]');
title('Sinal modulante m(t)');

subplot(3,1,3);
plot(t*1000,s,'-o','MarkerIndices',1:round(length(t)/30):length(t));
grid on;
xlabel('Tempo [ms]'); ylabel('Amplitude [V]');
title('Sinal modulado s(t)');

%% === FFTs (exemplo para a portadora) ===
N = length(t);
faxis = linspace(-Fs/2,Fs/2,N);
Cfft = fftshift(fft(c));
figure;
plot(faxis,abs(Cfft)/N);
grid on;
xlabel('Frequ�ncia [Hz]'); ylabel('|C(f)|');
title('Espectro da portadora');

