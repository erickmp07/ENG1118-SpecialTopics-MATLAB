%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Setup inicial
%
clc;       % limpa tela de comandos
clear;     % deleta todas as variáveis
close all; % fecha todas as janelas abertas

addpath('extraR02');

load('extraR02/musicas.mat');
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% COLOQUE SEU CÓDIGO AQUI ABAIXO!!!
%

% Item 02A: plote um histograma com as durações em minutos
duracaoEmMinutos = musicas.Duracao ./ 60;
histogram(duracaoEmMinutos');

% Item 02B: coloque em um novo vetor as estruturas das músicas com
% 5 minutos ou mais de duração
musicasLongas = musicas((musicas.Duracao ./ 60) >= 5, :);

% Item 02C: usando a função unique, conte a quantidade de estilos musicais
% distintos na lista
quantidadeDeEstilos = length(unique(musicas.Estilo));

% Item 02D: gerar matriz de células de duas colunas, com nome e artista 
% das músicas do estilo Rock
nomeEArtistasDeRock = musicas(strcmpi(musicas.Estilo, 'rock'), :);
nomeEArtistasDeRock = [upper(nomeEArtistasDeRock.Nome) nomeEArtistasDeRock.Artista];

%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Mostrar resultados
%
MostrarResultados(musicasLongas, quantidadeDeEstilos, nomeEArtistasDeRock);
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%