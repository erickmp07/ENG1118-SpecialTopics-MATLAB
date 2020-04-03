% Declare as variáveis A, B e C
A = [2 13 9; 4 1 7];
B = repmat(7, 20, 3);
C = repmat(9 : -1 : -10, 3, 1);

% Acesse o 3º elemento de A. Depois, o elemento da 2ª linha e 
% 3ª coluna de A. Depois, os elementos de todas as linhas e 
% apenas das colunas pares de C.
A(3)
A(2, 3)
C(:, 2 : 2 : end)

% Multiplique os elementos de C com os da matriz B tranposta
C .* B'

% Encontre os elementos de C menores que e substitua-os por pi
posicoes = find(C < 0);
C(posicoes) = pi

% Declare as variáveis D e E
pag1 = [3 2 7; 1.5 4 9; 0.7 10 100];
pag2 = repmat(10 : 10 : 30, 3, 1);

D = pag1;
D(:, :, 2) = pag2

E = repmat(11, 3, 3, 2)

% Concatene D e E na horizontal. Depois, na vertical.
% Depois, uma atrás da outra (DICA: crie outra matriz). 
ch = [D E]

cv = [D; E]

NM = E;
NM(:, :, [3 4]) = D