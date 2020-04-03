%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Setup inicial
%
clc;       % limpa tela de comandos
clear;     % deleta todas as variáveis
close all; % fecha todas as janelas abertas

addpath('extra04');  % adiciona pasta com arquivos extras para o exercício

valoresDeMercado = load('valoresDeMercado.txt');
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% COLOQUE SEU CÓDIGO AQUI ABAIXO!!!
%

% Gráfico 1: pizza com valores de mercado mais recentes
subplot(2, 2, 1);
pie(valoresDeMercado(: , end));
title('Valores de mercado atuais');
legend('Apple', 'Facebook', 'Google', 'Microsoft');


% Gráfico 2: linhas (ou áreas) com evolução dos valores de mercado (mês a mês)
subplot(2, 2, 2);
x = linspace(2007, 2017, ((2017 - 2007) * 12) + 1);
plot(x, [valoresDeMercado(:, :)]' ./ (1 .* 10 .^11));
title('Evolução das gigantes de tecnologia');
legend('Apple', 'Facebook', 'Google', 'Microsoft');
ylabel('Bilhão US$');
xlabel('Mês');

% Gráfico 3: linha com evolução da MÉDIA dos valores de mercado (mês a mês)
subplot(2, 2, [3 4]);
plot(x, [mean(valoresDeMercado(:, :))]' ./ (1 .* 10 .^11));
title('Evolução média das gigantes');
legend('[Apple, Facebook, Google, Microsoft]');
ylabel('Bilhão US$');
xlabel('Mês');

%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%