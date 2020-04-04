clear;
close all;
clc;

% Carregue os dados sobre câncer de ovário usando o
% comando ovarian_dataset
[x, target] = ovarian_dataset;

% Crie uma rede neural com 5 neurônios na camada
% escondida.
rede = patternnet(5);

% Treine a rede com os dados carregados
[redeTreinada, resultados] = train(rede, x, target);

% Plote a matriz de confusão dos resultados de teste
xDeTeste = x(:, resultados.testInd);

targetDeTeste = target(:, resultados.testInd);
resultadosDeTeste = redeTreinada(xDeTeste);

plotconfusion(targetDeTeste, resultadosDeTeste);