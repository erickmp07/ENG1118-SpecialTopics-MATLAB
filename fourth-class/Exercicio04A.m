clc;       % limpa tela de comandos
clear;     % deleta todas as variáveis
close all; % fecha todas as janelas abertas

% Plote um gráfico "pizza" com fatias de 60, 25% e 15%.
% Coloque o título "Fatias" e legendas "A", "B" e
% "C".
x = [60 25 15];
pie(x);
title('Fatias');
legend('A', 'B', 'C');

% Abra uma nova janela. Plotar "sin(10x)e-0.7x" para x
% de 0 a 8, com uma linha de cor magenta. Coloque os
% nomes "x" e "y" nos eixos.
figure;
x = 0 : 0.01 : 8;
y = sin(10 .* x) .* exp(-0.7 .* x);
plot(x, y, 'm');
xlabel('x');
ylabel('y');

% Sem apagar a curva anterior, plote uma linha "e-0.7x" e
% outra "-e-0.7x", ambas pretas e tracejadas.
hold on;
y1 = exp(-0.7 .* x);
y2 = -exp(-0.7 .* x);
plot(x, [y1; y2]', 'k--');

% Abra uma nova janela e divida-a em uma área
% superior e uma inferior. Na parte de cima, plote um
% gráfico de barras verticais com 10 barras: x indo de
% 2001 a 2010 e y indo de 1 a 10.
figure;
subplot(2, 1, 1);
x = 2001 : 2010;
y = 1 : 10;
bar(x, y);

% Na parte de baixo da janela, plote o gráfico abaixo
subplot(2, 1, 2);
x = [4 5];
y1 = [16 4];
y2 = [8 12];
barh(x, [y1; y2]');
set(gca, 'YTickLabel', {'Maio', 'Abril'});
grid on;