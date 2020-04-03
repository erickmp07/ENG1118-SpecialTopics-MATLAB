%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Setup inicial
%
clc;       % limpa tela de comandos
clear;     % deleta todas as variáveis
close all; % fecha todas as janelas abertas

addpath('extra06');  % adiciona pasta com arquivos extras para o exercício

 PlotarGraficoCorreto;
% PlotarGraficoIncorreto1;
% PlotarGraficoIncorreto2;
% PlotarGraficoIncorreto3;
% PlotarGraficoIncorreto4a;
% PlotarGraficoIncorreto4b;
% PlotarGraficoIncorreto4c;

janela = figure(1);
eixos = janela.Children;
linha = eixos.Children;
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% COLOQUE SEU CÓDIGO AQUI ABAIXO!
%

% Verifique se os limites do eixo y estão corretos (entre -1 e 1)
resultado1 = eixos.YLim;
gabarito1 = [-1 1];

if isequal(resultado1, gabarito1)
    disp('Resposta certa!');
else
    disp('Resposta errada');
end

% Verifique se a cor da linha está correta (vermelha)
resultado2 = linha.Color;
gabarito2 = [1 0 0];

if isequal(resultado2, gabarito2)
    disp('Resposta certa!');
else
    disp('Resposta errada');
end

% Verifique se os valores de y (em função dos de x) estão corretos
x = linha.XData;
gabarito3 = sin(5 .* x) .* exp(-0.5 .* x);
resultado3 = linha.YData;

if isequal(resultado3, gabarito3)
    disp('Resposta certa!');
else
    disp('Resposta errada');
end

% Verifique se os valores de x estão adequados
xMin = min(linha.XData);
xMax = max(linha.XData);

resultado4 = diff(linha.XData);

if all(resultado4 > 0) && all(resultado4 <= 0.1) && xMin == 0 && xMax == 10
    disp('Resposta certa!');
else
    disp('Resposta errada');
end
    
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%