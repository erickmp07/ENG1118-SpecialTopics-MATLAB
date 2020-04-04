close all;
clear;
clc;

% Resolva a equação x3 - 5x2 = 7x simbolicamente, e
% depois numericamente.
syms x
equacao = x ^ 3 - 5 * x ^ 2 - 7 * x == 0;
solucaoSimbolica = solve(equacao);
solucaoSimbolica = double(solucaoSimbolica)

parametros = [1 -5 -7 0];
solucaoNumerica = roots(parametros)

% Obtenha a expressão analítica para a derivada da
% função abaixo
f = @(x) sin(x) / (x ^ 2 + 1);
derivada = diff(f(x), x)
% derivada = diff(f, x)

% Plote a derivada obtida no item anterior, para x entre
% -10 e 10
fplot(derivada, [-10 10]);

% Calcule a integral a seguir, simbolicamente e depois
% numericamente. Confira se os resultados batem
integralSimbolica = int(x / (x ^ 2 + 1), x, [1 4]);
integralSimbolica = double(integralSimbolica)

dx = 0.01;
x = 1 : dx : 4;

g = @(x) x ./ (x .^ 2 + 1);
valores = g(x);

integralNumerica = trapz(valores) * dx