%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Setup inicial
%
clc;       % limpa tela de comandos
clear;     % deleta todas as variáveis
close all; % fecha todas as janelas abertas
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Carregue os dados de exemplo no arquivo patients
% do Matlab. Observe as variáveis que surgiram.
load patients;

% Calcule a média, a mediana e o desvio padrão do
% peso dos pacientes (Obs: pesos estão em libras).
media = mean(Weight)
mediana = median(Weight)
desvioPadrao = std(Weight)

% Verifique se há mais fumantes ou não-fumantes.
fumantes = histcounts(Smoker)
x = [0 1];
bar(x, fumantes);
ylabel('Quantidade de pessoas');
set(gca, 'XTickLabel', {'Não-fumantes', 'Fumantes'});

% Calcule o coeficiente de correlação das pressões
% sistólicas e diastólicas.
coefCorrPressao = corrcoef(Systolic, Diastolic)

% Faça uma regressão entre as pressões sistólicas (em
% y) e diastólicas (em x), usando a equação abaixo:
% y = b0 + b1*x
figure;

resposta = Systolic;

uns = ones(size(Systolic));
preditores = [uns Diastolic];

b = regress(resposta, preditores);

scatter(Diastolic, Systolic);

hold on;

x = linspace(0, 100);
y = b(1) + b(2) .* x;

plot(x, y);

xlabel('Pressão diastólica');
ylabel('Pressão sistólica');
title('Regressão Linear de Pressão Sistólica x Pressão Diastólica');
grid on;
