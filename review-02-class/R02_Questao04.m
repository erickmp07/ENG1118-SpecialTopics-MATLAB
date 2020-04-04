%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Setup inicial
%
clc;       % limpa tela de comandos
clear;     % deleta todas as variáveis
close all; % fecha todas as janelas abertas

addpath('extraR02');
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% COLOQUE SEU CÓDIGO AQUI ABAIXO!!!
%

% Item 4A: crie a função que retorna as notas finais de uma turma e teste
% com as notas da planilha da turma 1
turma1 = readtable('notas1.csv');
notasFinaisDaTurma1 = CalcularNotasFinais(turma1);

% Item 4B: obtenha o vetor de média das notas finais de cada turma
mediasDasNotasFinais = repelem(0, 25);

for i = 1 : 25
    turma = CalcularNotasFinais(readtable(['notas' num2str(i) '.csv']));
    mediasDasNotasFinais(i) = mean(turma);
end



% Item 4C: crie o arquivo solicitado com os nomes e as médias da turma 1
notasFinais1 = fopen('notasFinais1.txt', 'wt');
for i = 1 : length(notasFinaisDaTurma1)
    fprintf(notasFinais1, '%s: %.1f\n', turma1.Nomes{i}, notasFinaisDaTurma1(i));
end
fclose(notasFinais1);

%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Mostrar resultados
%
MostrarResultados(notasFinaisDaTurma1, mediasDasNotasFinais);
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%