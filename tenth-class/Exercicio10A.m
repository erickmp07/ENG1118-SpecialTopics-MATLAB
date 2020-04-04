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

desempregos = readtable('desemprego.xlsx', 'ReadRowNames', true);

comprimentoJanela = 500;
alturaJanela = 400;
esquerdaGrafico = 25;
fundoGrafico = 100;

janela = uifigure;
janela.Position = [500 250 comprimentoJanela alturaJanela];

eixos = uiaxes(janela);
eixos.Position = [esquerdaGrafico fundoGrafico (comprimentoJanela - 50) (alturaJanela-125)];

lblPais = uilabel(janela);
lblPais.Text = 'País';
lblPais.Position = [(esquerdaGrafico+5) (fundoGrafico-25) 50 (alturaJanela-385)];

dpdPais = uidropdown(janela);
dpdPais.Position = [(esquerdaGrafico+5) (fundoGrafico-50) 120 (alturaJanela-380)];
dpdPais.Items = desempregos.Properties.RowNames;
dpdPais.Value = 'Brazil';

lblAnoInicial = uilabel(janela);
lblAnoInicial.Text = 'Ano Inicial';
lblAnoInicial.Position = [(esquerdaGrafico+140) (fundoGrafico-25) 80 (alturaJanela-385)];

edfAnoInicial = uieditfield(janela);
% Campo numérico: edfAnoInicial = uieditfield(janela, 'numeric');
edfAnoInicial.Position = [(esquerdaGrafico+140) (fundoGrafico-50) 95 (alturaJanela-380)];
edfAnoInicial.HorizontalAlignment = 'Right';
edfAnoInicial.Value = '1980';

btnPlotar = uibutton(janela);
btnPlotar.Position = [(esquerdaGrafico+350) (fundoGrafico-50) 105 (alturaJanela-360)];
btnPlotar.Text = 'Plotar';

btnPlotar.ButtonPushedFcn = @(~, ~) plotar(eixos, desempregos, dpdPais.Value, edfAnoInicial.Value);

%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%