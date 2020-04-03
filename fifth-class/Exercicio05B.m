%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Setup inicial
%
clc;       % limpa tela de comandos
clear;     % deleta todas as variáveis
close all; % fecha todas as janelas abertas

addpath('extra05');  % adiciona pasta com arquivos extras para o exercício

inundacoes = CarregarInundacoes(2011, 2016);
terremotos = CarregarTerremotos(2011, 2016);
elevacoes = CarregarElevacoes();
temperaturas = CarregarTemperaturas2016();

DesenharMapas();
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% COLOQUE SEU CÓDIGO AQUI!
%

% Gráfico 1: dispersão de inundações
subplot(2, 2, 1);
x = inundacoes(: , 2);
y = inundacoes(: , 1);
areas = inundacoes( : , 3) .* 4;
scatter(x, y, areas, 'filled');


% Gráfico 2: dispersão de terremotos
subplot(2, 2, 2);
x = terremotos(: , 2);
y = terremotos(: , 1);
areas = repelem(50, length(x));
valores = terremotos(:, 3);
scatter(x, y, areas, valores, 'filled');
colorbar;
caxis([0 10]);

% Gráfico 3: contornos do relevo
subplot(2, 2, 3);
x = -180 : 0.5 : 180;
y = -90 : 0.5 : 90;
[X, Y] = meshgrid(x, y);
Z = elevacoes(:, :);
contour(X, Y, Z, 10, 'Fill', 'on'); 
colorbar;
caxis([0 4000]);

% Gráfico 4: imagem da temperatura
subplot(2, 2, 4);
x = -180 : 180;
y = -90 : 90;
[X, Y] = meshgrid(x, y);
Z = mean(temperaturas(:, :, :), 3);
imagesc(x, y, Z);
colorbar;
caxis([-20 40]);
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

