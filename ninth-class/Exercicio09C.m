%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Setup inicial
%
clc;       % limpa tela de comandos
clear;     % deleta todas as variáveis
close all; % fecha todas as janelas abertas

addpath('extra09');

dadosDosPaises = CarregarDadosDaWEO();
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% COLOQUE SEU CÓDIGO AQUI ABAIXO!
% 

% Estatística 1: histórico da variação do PIB e do desemprego nos EUA
desemprego = dadosDosPaises{ {'United States'}, 'Desemprego'};
variacaoPIB = dadosDosPaises.Variacao_do_PIB(185, :);

anos = 1980 : 2016;

figure;
yyaxis left;
plot(anos, desemprego);

yyaxis right;
plot(anos, variacaoPIB);

legend('Desemprego', 'Variação do PIB');

% Estatística 2: histórico do PIB e do desemprego nos BRICS
desemprego = dadosDosPaises{ {'Brazil', 'Russia', 'India', 'China', 'South Africa'}, 'Desemprego'};
PIB = dadosDosPaises{ {'Brazil', 'Russia', 'India', 'China', 'South Africa'}, 'PIB'};

figure;
subplot(2, 1, 1);
plot(anos, desemprego);
title('Desemprego');

subplot(2, 1, 2);
plot(anos, PIB);
legend({'Brazil', 'Russia', 'India', 'China', 'South Africa'});
title('PIB');

% Estatística 3: barras com os 10 maiores PIBs per Capita do mundo
[PIBperCapita, indices] = sort(dadosDosPaises.PIB_per_Capita(:, end), 'descend');
in = any( isnan(PIBperCapita), 2);
PIBperCapita = [PIBperCapita(~in, :); PIBperCapita(in, :)];
indices = [indices(~in, :); indices(in, :)];
top10 = PIBperCapita(1 : 10, :);

figure;
bar(top10);
paises = dadosDosPaises.Properties.RowNames(indices(1 : 10));
set(gca, 'XTickLabel', paises);
set(gca,'XTickLabelRotation',45);
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%