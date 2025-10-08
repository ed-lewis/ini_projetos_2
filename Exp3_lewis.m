clear all; close all; clc
%% Configuração do filtro PASSA-ALTA
%fc = ; % Freq de corte Hz (calcular)
C = 1e-6;
R = 150;

%% --- Definicao das Frequencias da Tabela 1 ---
% Lista das frequencias f [Hz] para as quais o ganho deve ser calculado.
f_tabela = [10, 50, 100, 200, 250, 300, 350, 400, 450, 500, 550, 600, 650, 700, 800, 900, 1000, 1060, 1200, 1400, 1600, 1800, 2000, 2500, 3000, 3500, 4000, 4500, 5000, 6000, 7000, 8000];
N_freq = length(f_tabela); % Numero de pontos

%% === Inicialização das variáveis de resultado ===
G_teorico = zeros(1, N_freq); % vetor para o ganho linear (Vout/Vin)
G_dB_teorico = zeros(1, N_freq); % vetor para o ganho em decieis (dB)


%% Fórmulas para criar funções
fc = (1 /(2*pi*R*C) ); % Freq de corte
disp(fc);

% G = ( (2*pi*R*C)/(sqrtm(1+(2*pi*f*R*C)^2)) );
for i = 1:N_freq
    f = f_tabela(i); % Frequencia atual
    % Ganho teórico - vetor para ganho linear
    G_teorico(i) = ( (2*pi*f*R*C)/(sqrtm(1+(2*pi*f*R*C)^2)) );
    % Ganho em decibeis (G[dB]) - vetor para ganho em decibeis
    G_db_teorico(i) = 20 * log10(G_teorico(i));   
end


%% --- Preenchimento da Tabela 1  ---
% Exibe os resultados para preencher a coluna "G_teorico" da Tabela 1.
fprintf('Resultados Teoricos para a Tabela 1:\n');
fprintf('Frequência [Hz] | Ganho Teórico []   | Ganho Teorico [dB]\n');
fprintf('----------------------------------\n');
for i = 1:N_freq
    fprintf('%15.1f | %18.4f | %18.4f\n', f_tabela(i), G_teorico(i),G_db_teorico(i));
end
fprintf('---------------------------------------------------\n');

%% PLOTAGEM
figure(1); % abre uma nova janela de figura
semilogx(f_tabela, G_dB_teorico, '-b', 'LineWidth', 2); % Plota G[dB] em escala logaritmica no eixo X (frequencia)
grid on; % Adiciona linhas de grade ao grafico
title('Diagrama de Bode (Ganho) - Filtro Passa-Alta RC'); % Titulo
xlabel('Frequência (Hz) [Escala Logarítmica]'); % Rotulo do eixo X
ylabel('Ganho (dB)'); % Rotulo do eixo Y

% Adiciona a linha de -3dB na frequencia de corte para analise.
hold on;
plot([fc, fc], [-40, 0], '--r'); % Linha vertical em fc
plot([10, 8000], [-3, -3], '--g'); % Linha horizontal em -3dB
legend('Ganho Teorico', 'Frequencia de Corte (fc)', '-3 dB', 'Location', 'SouthEast');
ylim([-40, 5]); % Limite do eixo Y para melhor visualizacao
