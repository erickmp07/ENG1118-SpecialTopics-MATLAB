%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Setup inicial
%
clc;       % limpa tela de comandos
clear;     % deleta todas as variáveis
close all; % fecha todas as janelas abertas

vetor = input('Digite um vetor com pelo menos 1 elemento: ');
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% COLOQUE SEU CÓDIGO AQUI ABAIXO!
%

% Se a entrada não for um vetor, exiba uma mensagem de erro 
if isempty(vetor)
    error('Vetor vazio');
elseif ~isvector(vetor)
    error('Não é um vetor');
end

% Verifique o primeiro elemento
disp('** O primeiro elemento é positivo, negativo ou nulo? **');
if vetor(1) > 0
    disp('Positivo');
elseif vetor(1) < 0
    disp('Negativo');
else
    disp('Nulo');
end

% Verifique se todos os números são positivos
disp('** Todos os números são positivos? **');
if all(vetor > 0)
    disp('Sim');
else
    disp('Não');
end
  
% Verifique se existe algum número ímpar no vetor
disp('** Existe algum número ímpar? **');
if any(rem(vetor, 2) ~= 0)
    disp('Sim');
else
    disp('Não');
end

% Imprima os elementos cujo valor está dentro do intervalo de 5 a 10
disp('** Elementos de 5 a 10: **');
disp(vetor(vetor >= 5 & vetor <= 10));

%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%