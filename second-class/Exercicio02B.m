%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Setup inicial
%
clc;       % limpa tela de comandos
clear;     % deleta todas as variáveis
close all; % fecha todas as janelas abertas

addpath('extra02'); % adicionar pasta com arquivos extras para o exercício

USAR_ESCALA_CINZA = 1;

imagem1 = CarregarImagem('image1.jpg', USAR_ESCALA_CINZA);
imagem2 = CarregarImagem('image2.jpg', USAR_ESCALA_CINZA);
imagem3 = CarregarImagem('image3.png', USAR_ESCALA_CINZA);
imagem4 = CarregarImagem('image4.png', USAR_ESCALA_CINZA);
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% COLOQUE O SEU CÓDIGO AQUI!
%

% Aumente o brilho da Imagem 1
novaImagem1 = imagem1 + 50;

% Converta os pixels para branco/preto na Imagem 2
novaImagem2 = imagem2;
novaImagem2(find(imagem2 <=128)) = 0;
novaImagem2(find(imagem2 >128)) = 255;

% Divida a Imagem 3 em 4 partes, reordene-as e apague a janela.
novaImagem3 = imagem3;
fig1 = imagem3(1:200, 1:200);
fig2 = imagem3(201:400, 1:200);
fig3 = imagem3(1:200, 201:400)*0 + 255;
fig4 = imagem3(201:400, 201: 400);

novaImagem3 = [fig2 fig3; fig4 fig1];

% Aplique uma sombra na Imagem 4
novaImagem4 = imagem4;
v = 0:1/319:1;
A = repmat(v,300,1);
novaImagem4 = novaImagem4 .* A;

%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Mostrar imagens antigas e novas em uma janela
%
MostrarImagens(imagem1 , imagem2 , imagem3 , imagem4, ...
               novaImagem1, novaImagem2, novaImagem3, novaImagem4);
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%