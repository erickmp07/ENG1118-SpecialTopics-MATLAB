%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Setup inicial
%
clc;       % limpa tela de comandos
clear;     % deleta todas as variáveis
close all; % fecha todas as janelas abertas

addpath('extra02'); % adicionar pasta com arquivos extras para o exercício

USAR_ESCALA_CINZA = 0;

imagem1 = CarregarImagem('image1.jpg', USAR_ESCALA_CINZA);
imagem2 = CarregarImagem('image2.jpg', USAR_ESCALA_CINZA);
imagem3 = CarregarImagem('image3.png', USAR_ESCALA_CINZA);
imagem4 = CarregarImagem('image4.png', USAR_ESCALA_CINZA);
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% COLOQUE O SEU CÓDIGO AQUI ABAIXO! 
%

% Intensifique a cor verde da Imagem 1
novaImagem1 = imagem1;
novaImagem1(:, :, 2) = novaImagem1(:, :, 2) + 150;

% Pixele a Imagem 2
novaImagem2 = imagem2;
novaImagem2 = novaImagem2(1 : 20 : end, 1 : 20 : end, :);

% Desenhe um quadrado roxo 100x100 na Imagem 3
novaImagem3 = imagem3;

roxo = repmat(95, 100, 100);
roxo(:, :, 2) = 0;
roxo(:, :, 3) = 95;

novaImagem3(1:200, 201:400, :) = imagem3(1:200, 201:400, :)*0 + 255;

novaImagem3(51: 150, 251 : 350, :) = roxo;

% Adicione uma marca d'água xadrez na Imagem 4
novaImagem4 = imagem4;

s = 0.75;

quadrado = repmat(1, 10, 10);
vetorSombra1 = [quadrado quadrado * s];
linha1 = repmat(vetorSombra1, 1, 16);

vetorSombra2 = [quadrado * s quadrado];
linha2 = repmat(vetorSombra2, 1, 16);

matrizSombra = repmat([linha1; linha2], 15, 1, 3);

novaImagem4 = imagem4 .* matrizSombra;
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Mostrar imagens antigas e novas em uma janela
%
MostrarImagens(imagem1 , imagem2 , imagem3 , imagem4, ...
               novaImagem1, novaImagem2, novaImagem3, novaImagem4);
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%