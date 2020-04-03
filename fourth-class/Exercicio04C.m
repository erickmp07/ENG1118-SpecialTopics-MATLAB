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

% Gráfico 1: tendência de crescimento nos últimos 5 anos
subplot(2, 2, 1);
x = linspace(2012, 2017, ((2017 - 2012) * 12) + 1);
plot(x, [valoresDeMercado(:, [end - 60 : end])]' ./ (1 .* 10 .^11), '*');
lsline;
title('Valores de Mercado nos últimos 5 anos');
legend('Apple', 'Facebook', 'Google', 'Microsoft');
ylabel('Bilhão US$');
xlabel('Ano');

% Gráfico 2: crescimento de hoje comparado com 3 anos atrás
subplot(2, 2, 2);
bar([((valoresDeMercado(:, end) - valoresDeMercado(:, end - 37)) ./ valoresDeMercado(:, end - 37)) .* 100]');
title('Taxa de Crescimento em Três Anos');
ylabel('(%)');
set(gca, 'XTickLabel', {'Apple', 'Facebook', 'Google', 'Microsft'});

% Gráfico 3: crescimentos ano a ano
subplot(2, 2, [3 4]);
x = linspace(2008, 2016, (2016 - 2008));
y = valoresDeMercado(:, end - 107 : 12 : end);
bar(x, [(diff(y, 1, 2) ./ y(:, 1 : end - 1)) .* 100]');
title('Evolução da Taxa de Crescimento Ano a Ano');
legend('Apple', 'Facebook', 'Google', 'Microsoft');
ylabel('(%)');
xlabel('Ano');

%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%