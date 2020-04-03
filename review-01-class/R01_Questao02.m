%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Setup inicial
%
clc;       % limpa tela de comandos
clear;     % deleta todas as variáveis
close all; % fecha todas as janelas abertas

addpath('extraR01');

notas = GerarNotas();
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% COLOQUE SEU CÓDIGO AQUI ABAIXO!!!
%

% Item 2A: calcule o número de alunos
numeroDeAlunos = length(notas);

% Item 2B: calcule a menor de todas as notas de geografia
menorNotaDeGeografia = min(min(notas(3, :, :)));

% Item 2C: calcule a matriz 2D com a média das 3 provas de cada aluno para
% cada matéria
medias = mean(notas, 3);

% Item 2D: calcule o vetor com o mínimo das médias de cada aluno
minimosDasMedias = min(medias);

% Item 2E: conte quantos alunos não passaram em pelo menos uma matéria
% (porque tiveram pelo uma média abaixo de 5)
numeroDeAlunosEmRecuperacao = length(find(minimosDasMedias < 5.0));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Mostrar resultados
%
MostrarResultados(numeroDeAlunos, menorNotaDeGeografia,  ...
    medias, minimosDasMedias, numeroDeAlunosEmRecuperacao)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
