%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Setup inicial
%
clc;       % limpa tela de comandos
clear;     % deleta todas as variáveis
close all; % fecha todas as janelas abertas

addpath('extra05');  % adiciona pasta com arquivos extras para o exercício

inundacoes = CarregarInundacoes(1985, 2016);
terremotosNoMundo = CarregarTerremotos(2000, 2016);
terremotosNoJapao = CarregarTerremotos(2000, 2016, [32 46; 130 145]);
altitudes = CarregarElevacoes();
temperaturas = CarregarTemperaturas2016();
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% COLOQUE SEU CÓDIGO AQUI!
%

% Gráfico 1: mortos x deslocados nas enchetes
subplot(2, 2, 1);
deslocados = inundacoes(:, end);
mortos = inundacoes(:, end - 1);
loglog(deslocados, mortos, '.');
title('Deslocados x Mortos');

% Gráfico 2: histogramas de escala de terremotos
subplot(2, 2, 2);
yyaxis left;
histogram(terremotosNoMundo(:, 3));
hold on;
yyaxis right;
histogram(terremotosNoJapao(:, 3));
title('Magnitudes dos Terremotos');
legend('Mundo', 'Japão');

% Gráfico 3: barras com pico de altitude no oeste e no leste
subplot(2, 2, 3);
maximoOeste = max(altitudes(1 : (end - 1) / 2));
maximoLeste = max(altitudes((end - 1) / 2 : end));
bar([maximoOeste maximoLeste]);
title('Picos de Altitude');
set(gca, 'XTickLabel', {'Pico do Oeste', 'Pico do Leste'});

% Gráfico 4: barras com as temperaturas do Rio e de Nova York
subplot(2, 2, 4);
mediaRio = mean(temperaturas(90 + 23, (360 / 2) - 42, :));
mediaNY = mean(temperaturas(90 - 40, (360 / 2) - 74, :));
bar([mediaRio, mediaNY]);
title('Temperaturas Médias');
set(gca, 'XTickLabel', {'Rio de Janeiro', 'Nova York'});
hold on;
maximaRio = max(temperaturas(90 + 23, (360 / 2) - 42, :), [], 3);
minimaRio = min(temperaturas(90 + 23, (360 / 2) - 42, :), [], 3);
maximaNY = max(temperaturas(90 - 40, (360 / 2) - 74, :), [], 3);
minimaNY = min(temperaturas(90 - 40, (360 / 2) - 74, :), [], 3);
errorbar([1 2], [mediaRio mediaNY], [(mediaRio - minimaRio) (mediaNY - minimaNY)], [(maximaRio - mediaRio) (maximaNY - mediaNY)], '*');

%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%