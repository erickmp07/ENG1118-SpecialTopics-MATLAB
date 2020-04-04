clc;
close all;
clear;

matricula = {'0918492'; '7334839'; '7334839'};
idade = [31; 138; 179];

alunos = table(matricula, idade);
alunos.Properties.RowNames = {'Jan'; 'Einstein'; 'Newton'};

alunos.notas = [10 9.5 9.2; 6.4 7.4 8.6; 5.6 3.5 4.6];

media = mean(alunos{:, 3}, 2);

notas = alunos{:, 3};

save('notas.txt', 'notas', '-ASCII');

linhas = alunos([1 3], :);

writetable(linhas, 'notas.xls');