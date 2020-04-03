%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Setup inicial
%
clc;       % limpa tela de comandos
clear;     % deleta todas as vari�veis
close all; % fecha todas as janelas abertas

addpath('extra01'); % adicionar pasta com arquivos extras para o exerc�cio

audio = CarregarAudio('extra01/cantorEInstrumentos.wav');
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% COLOQUE SEU CÓDIGO AQUI ABAIXO!!!
%

% Parte 1: adicione o efeito "fade in" e o "fade out" de 2 segundos
fadeIn = 0 : 1 / ((44100 * 2) - 1) : 1;
fadeOut = 1 : -(1 / ((44100 * 2) - 1)) : 0;

audio(1 : (44100 * 2)) = audio(1 : (44100 * 2)) .* fadeIn;
audio(end - (44100 * 2) + 1 : end) = audio(end - (44100 * 2) + 1 : end) .* fadeOut;

% Parte 2: acelere a música, removendo 25% da duração
 audio(1 : 4 : end) = [];

% Parte 3: faça com que a música toque de três para frente
audio(1 : end) = audio(end : -1 : 1);

% Parte 4: desacelere a música, dobrando sua duração
zeros = [audio audio] * 0;
zeros(1 : 2 : end) = audio(1 : end);
audio = zeros;

%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Mostrar e tocar sinais de audio
%
AbrirJanelaDeAudio(audio);
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
