%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Setup inicial
%
clc;       % limpa tela de comandos
clear;     % deleta todas as variáveis
close all; % fecha todas as janelas abertas

addpath('extra06');  % adiciona pasta com arquivos extras para o exercício
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% COLOQUE SEU CÓDIGO AQUI ABAIXO!
%

% Pergunta 1: peça para gerar um vetor de inteiros de 0 a 7
tic;
acertos = 0;

resultado = input('1. Gere um vetor de inteiros de 0 a 7: ');
gabarito1 = 0 : 7;
if isequal(resultado, gabarito1)
    acertos = acertos + 1;
    disp('Resposta correta!');
else
    disp('Resposta errada');
end

% Pergunta 2: peça para acessar os primeiros 5 elementos do vetor x
entrada2 = input('2. Acesse os primeiros 5 elementos de um vetor x: ', 's');
x = rand(1, 10);
gabarito2 = x(1 : 5);

resultado2 = eval(entrada2);

if isequal(resultado2, gabarito2)
    acertos = acertos + 1;
    disp('Resposta correta!');
else
    disp('Resposta errada');
end

% Pergunta 3: caso haja pelo menos 1 acerto, peça para gerar um vetor de
% 100 números aleatórios reais entre 0 e 1
if acertos > 0
    entrada3 = input('3.Gere um vetor de 10 números aleatórios reais entre 0 e 1: ', 's');
    resultado3_1 = eval(entrada3);
    resultado3_2 = eval(entrada3);
    
    tamanhoGabarito3 = 10;
    
    if ~isequal(resultado3_1, resultado3_2) && length(resultado3_1) == tamanhoGabarito3 &&... 
            length(resultado3_1) == tamanhoGabarito3 && min(resultado3_1) >= 0 && ... 
            max(resultado3_1) <= 1 && min(resultado3_2) >= 0 && ... 
            max(resultado3_2) <= 1
        disp('Resposta correta!');
    else
        disp('Resposta errada');
    end
end
toc;


% Exiba o tempo que o usuário demorou para responder todas as perguntas


%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%