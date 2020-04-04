%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Setup inicial
%
clc;       % limpa tela de comandos
clear;     % deleta todas as variáveis
close all; % fecha todas as janelas abertas

addpath('extraR02');
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% COLOQUE SEU CÓDIGO AQUI ABAIXO!!!
%

% Item 1A: gere uma matriz 6x6 com inteiros aleatórios entre 30 e 70
inteirosAleatorios = randi([30 70], 6, 6);

% Item 1B: verifique em cada linha da matriz do item 1B se existe algum
% número múltiplo de 7, gerando um vetor de 0s e 1s
existeMultiploDe7NaLinha = any(rem(inteirosAleatorios, 7) == 0, 2);

% Item 1C: leia o texto do arquivo extraR02/lendaSith.txt e coloque cada
% linha como um elemento de um vetor "em pé" de células. 
falasDoDialogo = strsplit(fileread('extraR02/lendaSith.txt'), char(10))';


% Item 1D: substitua no vetor do item 1C as ocorrências do texto "Anakin"
% por "Darth Vader" e as ocorrências de "Palpatine" por "Imperador".
falasDoDialogo = strrep(falasDoDialogo, 'Anakin', 'Darth Vader');
falasDoDialogo = strrep(falasDoDialogo, 'Palpatine', 'Imperador');

% Item 1E: plote as 49 linhas 2D na mesma tela
x = linspace(-3, 3, 100);
hold on;
for termos = 1 : 49
    expressoes = x .^ 3 + termos;
    plot(x, expressoes);
end


%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Mostrar resultados
%
MostrarResultados(inteirosAleatorios, existeMultiploDe7NaLinha, falasDoDialogo);
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%