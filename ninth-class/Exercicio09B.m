%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Setup inicial
%
clc;       % limpa tela de comandos
clear;     % deleta todas as variáveis
close all; % fecha todas as janelas abertas
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% COLOQUE SEU CÓDIGO AQUI ABAIXO!
%

% Estatística 1: evolução da taxa de pobreza extrema
pobreza = load('extra09/taxaDePobrezaExtrema.txt');
plot(pobreza(:, 1), pobreza(:, 2));

% Estatística 2: histórico da variação do PIB e do desemprego
taxaDesemprego = readtable('extra09/taxaDeDesemprego.csv');
variacaoPIB = readtable('extra09/variacaoDoPIB.csv');

figure;
yyaxis left
plot(taxaDesemprego{:, 1}, taxaDesemprego{:, 2});

yyaxis right
plot(variacaoPIB.Ano, variacaoPIB.VariacaoDoPIB);

% Estatística 3: proporção de homens/mulheres na política
eleitos2016 = readtable('extra09/eleitos2016.xlsx');
feminino = sum(eleitos2016{strcmpi(eleitos2016.Sexo, 'feminino'), 6});
masculino = sum(eleitos2016{strcmpi(eleitos2016.Sexo, 'masculino'), 6});

figure;
pie([feminino, masculino]);
legend({'Mulheres', 'Homens'});

%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%