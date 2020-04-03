%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Setup inicial
%
clc;       % limpa tela de comandos
clear;     % deleta todas as variáveis
close all; % fecha todas as janelas abertas

addpath('extraR01');

taxasDeDesemprego = CarregarTaxasDeDesemprego();
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% COLOQUE SEU CÓDIGO AQUI ABAIXO!!!
%

% Item 03A: use a função reshape para transformar o vetor na matriz desejada
taxasSeparadasEmAnos = reshape(taxasDeDesemprego, 12, 20)';

% Item 03B: linha 2D com a média do desemprego em cada ANO
x = 1997 : 2016;
y = mean(taxasSeparadasEmAnos, 2);
plot(x, y);

% Item 03C: barras 2D com a média do desemprego em cada MÊS
mediasMensais = mean(taxasSeparadasEmAnos);

figure;
x = 1 : 12;
bar(x, mediasMensais);

% Item 03D: ano com a menor taxa média de desemprego
anoComMenosDesemprego = NaN;
[x, i] = min(mean(taxasSeparadasEmAnos, 2));
anoComMenosDesemprego = 1996 + i;

%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Mostrar resultados
%
MostrarResultados(taxasSeparadasEmAnos, anoComMenosDesemprego);
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%