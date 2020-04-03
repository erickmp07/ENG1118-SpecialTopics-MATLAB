clear;
close all;
clc;

% Crie o texto "Pi é igual a " seguido de ? com as
% primeiras 15 casas decimais.
sprintf('Pi é igual a %.15f', pi)

% Declare a matriz
matriz = {'Um' 1 1; 'Dois' 2 [2 2]; 'Três' 3 [3 3 3]};

% Acesse o texto na terceira linha e primeira coluna, e
% concatene um "s" no final da palavra
[matriz{3, 1} 's']

% Acesse todos elementos da segunda coluna da matriz
% e calcule sua média
mean([matriz{:, 2}])

% Crie uma função que recebe um texto com 10 dígitos
% de telefone (ex: 2135271001) e retorna um outro texto
% com esse número formatado (ex: (21) 3527-1001)
telefone = '2135271001';
telefoneFormatado = formatarTexto(telefone)