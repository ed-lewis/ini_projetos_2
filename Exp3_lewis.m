clear all; close all; clc
%% Configuração do filtro PASSA-ALTA
%fc = ; % Freq de corte Hz (calcular)
C = 1e-6;
R = 150;

%% --- Definicao das Frequencias da Tabela 1 ---
% Lista das frequencias f [Hz] para as quais o ganho deve ser calculado.
f_tabela = [10, 50, 100, 200, 250, 300, 350, 400, 450, 500, 550, 600, 650, 700, 800, 900, 1000, 1060, 1200, 1400, 1600, 1800, 2000, 2500, 3000, 3500, 4000, 4500, 5000, 6000, 7000, 8000];
N_freq = length(f_tabela); % Numero de pontos
%% Fórmulas para criar funções
fc = (1 /(2*pi*R*C) ); % Freq de corte
%disp(fc);

% G = ( (2*pi*R*C)/(sqrtm(1+(2*pi*f*R*C)^2)) );
Gt = GTeorico(R, C);
disp(Gt);



%% Transformar em DB
Gdb = 20*log(Gt); 



