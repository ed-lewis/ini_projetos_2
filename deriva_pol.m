% Esta fun¸c~ao calcula a derivada de primeira ordem de
% um polin^omio de grau qualquer.

function [deriv] = deriva_pol(coef)

ncoef = length(coef); % numero de coeficientes do polin^omio

if ncoef == 1
    deriv = 0;
else 
    for i = 1:ncoef - 1
        deriv(i) = coef(i)*(ncoef - i);
    end
end