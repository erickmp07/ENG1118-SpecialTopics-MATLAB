%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Setup inicial
%
clc;       % limpa tela de comandos
clear;     % deleta todas as variáveis
close all; % fecha todas as janelas abertas

addpath('extraR01');
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% COLOQUE SEU CÓDIGO AQUI ABAIXO!!!
%

% Item 4A: gere 10000 valores aleatórios da posição do primeiro corte x1
posicoesX1 = rand([1, 10000]);

% Item 4B: gere 10000 valores aleatórios da posição do segundo corte x2
posicoesX2 = 0 + (posicoesX1 - 0) .* rand([1, 10000]);

% Item 4C: calcule a probabilidade do segundo corte x2 ser maior que 0.5
probabilidade = (length(find(posicoesX2 > 0.5)) / 10000) * 100;

% Item 4D: histograma dos valores de x2 com a linha da curva teórica, com
% eixos y separados
yyaxis('left');
histogram(posicoesX2);

hold on;

yyaxis('right');
x = linspace(0, 1, 10000);
y = -log(x);
plot(x, y);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Mostrar resultados
%
MostrarResultados(probabilidade);
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%