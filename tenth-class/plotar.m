function plotar( eixos, tabela, nomePais, anoInicial )

% Se campo for numérico, não precisa do eval
ano = eval(anoInicial);

x = ano : 2016;
y = tabela{nomePais, (ano-1980+1) : end};

plot(eixos, x, y);
title(eixos, sprintf('Histórico da Taxa de Desemprego do(a) %s', nomePais));

end

