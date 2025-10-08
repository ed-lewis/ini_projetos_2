function [ganho_teorico] = GTeorico(R, C)
    % Este é o corpo da função
    
     f_tabela = [10, 50, 100, 200, 250, 300, 350, 400, 450, 500, 550, 600, 650, 700, 800, 900, 1000, 1060, 1200, 1400, 1600, 1800, 2000, 2500, 3000, 3500, 4000, 4500, 5000, 6000, 7000, 8000];
     N_freq = length(f_tabela); % Numero de pontos
     for i = 1:N_freq
     f = f_tabela(i); % Frequencia atual
     ganho_teorico = ( (2*pi*f*R*C)/(sqrtm(1+(2*pi*f*R*C)^2)) );
     % Ganho Linear (G)
     % Numerador: 2 * pi * f * R * C
     % Num = 2 * pi_const * f * R * C;
     % Denominador: sqrt(1 + (2 * pi * f * R * C)^2)
     % Den = sqrt(1 + (Num)^2);
     % G_teorico(i) = Num / Den;
     % Ganho em Decibeis (G[dB])
     % G_dB_teorico(i) = 20 * log10(G_teorico(i));
     % end
    
    
    
    f = 10;
    ganho_teorico = ( (2*pi*f*R*C)/(sqrtm(1+(2*pi*f*R*C)^2)) );
end