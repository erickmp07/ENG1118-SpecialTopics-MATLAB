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

% Item 1A: declare a matriz
matriz = [93 21 39 55; 48 78 30 12; 1 : 4];

% Item 1B: declare o vetor
vetor = 50 : -1 : -50;

% Item 1C: declare o vetor em pé
vetorEmPe = vetor(:);

% Item 1D: declare a variavel repeticoes
repeticoes = repelem(1 : 50, 1 : 50);

% Item 1E: plote o gráfico de linha 2D indicado na questão
x = linspace(-10, 10, 200);
y = exp(-0.4 .* abs(x)) .* cos(4 .* x);
plot(x, y);

% Item 1F: plote o gráfico de superfície 3D indicado na questão
figure;

x = linspace(-3, 3, 150);
y = linspace(-3, 3, 150);
[X, Y] = meshgrid(x, y);

Z = sin(4 .* sqrt(X .^ 2 + Y .^ 2)) .* exp(-sqrt(X .^ 2 + Y .^ 2));
surf(X, Y, Z);

%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Mostrar resultados
%
MostrarResultados(matriz, vetor, vetorEmPe, repeticoes);
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%