%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Setup inicial
%
clc;       % limpa tela de comandos
clear;     % deleta todas as vari�veis
close all; % fecha todas as janelas abertas

addpath('extra01'); % adicionar pasta com arquivos extras para o exerc�cio

audioDosInstrumentos = CarregarAudio('extra01/instrumentos.wav');
audioDoCantor = CarregarAudio('extra01/cantor.wav');
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% COLOQUE SEU CÓDIGO AQUI ABAIXO!!!
% 

% Parte 1: aumente o volume do �udio do cantor
audioDoCantor = audioDoCantor * 4;

% Parte 2: sincronize o �udio do cantor com os instrumentos
audioDoCantor = audioDoCantor(22051 : end);

% Parte 3: repita o �udio dos instrumentos
audioDosInstrumentos = [audioDosInstrumentos audioDosInstrumentos];

% Parte 4: repita 4 vezes a �ltima frase do cantor
finalCantor = audioDoCantor(end - 91000 : end);
audioDoCantor = [audioDoCantor finalCantor finalCantor finalCantor finalCantor];

% Parte 5: adicione o efeito "fade in" de 3 segundos no come�o dos dois �udios
fade = 0 : 1 / (132300 - 1) : 1;
inicioCantor = audioDoCantor(1 : 132300);
inicioInstrumentos = audioDosInstrumentos(1 : 132300);

audioDoCantor(1 : 132300) = inicioCantor .* fade;
audioDosInstrumentos(1 : 132300) = inicioInstrumentos .* fade;
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Mostrar e tocar sinais de audio
%
AbrirJanelaDeAudios(audioDosInstrumentos, audioDoCantor);
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
