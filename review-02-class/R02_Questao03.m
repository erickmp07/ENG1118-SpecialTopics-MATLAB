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

% Item 3A: calcule o percentual de votos contrários
votacao = readtable('extraR02/votacao.xlsx');
totalVotosContra = sum(strcmpi(votacao.Votos, 'contra'));
[totalVotos, ~] = size(votacao);
percentualContra = (totalVotosContra / totalVotos) * 100;

% Item 3B: calcule o percentual de votos contrários dentro do PMDB
totalVotosContraPMDB = sum(strcmpi(votacao.Votos, 'contra') & strcmpi(votacao.Partidos, 'pmdb'));
totalVotosPMDB = sum(strcmpi(votacao.Partidos, 'pmdb'));
percentualContraPMDB = (totalVotosContraPMDB / totalVotosPMDB) * 100;

% Item 3C: obtenha a nova tabela e acesse um dos votos pelo nome
votacaoModificada = votacao;
votacaoModificada.Deputados = [];
votacaoModificada.Properties.RowNames = votacao.Deputados;

votoDeUmDeputado = votacaoModificada.Votos('Chico Alencar');

%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Mostrar resultados
%
MostrarResultados(percentualContra, percentualContraPMDB, votacaoModificada, votoDeUmDeputado);
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%