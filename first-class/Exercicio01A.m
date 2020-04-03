% Declare as variáveis a, b, c
a=42
b=(31*13)+(23-2)
c=2.5-((pi^5)/(3.7*97.881))

% Some c com a divisão de a por b
c + (a / b)

% Declare as variáveis x, y, z
x = [2 1 4 7];
y = 3 : 20;
z = 9 : -1 : -8;

% Acesse o primeiro elemento de x, o último de y e o 
% antepenúltimo de z
x(1)
y(end)
z(end - 2)

% Substitua os 4 primeiros elementos de z pelos de x
z(1 : 4) = x(1 : 4)

% Eleve os elementos de y ao quadrado e divida-os
% pelos elementos de z
(y .^ 2) ./ z

% Acesse os elementos ímpares de y e concatene-os com 
% os elementos de x
[y(1 : 2 : end) x]