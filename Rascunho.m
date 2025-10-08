clear all; close all; clc
%% dados do sinal
f = 10000;%Freq entrada Hz
fs =20000;% Frequencia de amostragem Hz
%% gerar sinal ‘contínuo’ com 10 períodos. Para isso:
% alta discretização (taxa de 100*f)
% T=10, ié, 10 períodos do sinal
tempo = [0:1/(100*f):10/f];
sinal = sin(2*pi*f*tempo); % Geração onda senoidal em uma
%% plotar sinal
plot(tempo,sinal)
hold;
%% sinal amostrado
Ts = 1/fs;
N=length(tempo);
n = [0:1:N-1];
t_sample = [0 : Ts : n(N)*Ts];
DigitalFrequency=2*pi*f/fs;
sinal_sample = sin (DigitalFrequency.*n);
plot(t_sample, sinal_sample,'o');
axis([0 10/f -1.5 1.5])
set(gca,'FontSize',16)
set(gca,'FontSize',16)
xlabel('$t$','Interpreter','LaTex','FontSize',18)
ylabel('$x[nT_s],x(t)$','Interpreter','LaTex','FontSize',18)