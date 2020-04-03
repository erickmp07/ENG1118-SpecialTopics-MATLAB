function totalDePalavras = Parte5_ContarPalavras(roteiro, personagem)
novoRoteiro = Parte1_FiltrarPorPersonagem(roteiro, personagem);

stringSplit = strsplit(strjoin(novoRoteiro(:, 2)), ' ');

if strcmp(stringSplit, '')
    totalDePalavras = 0;
else
    totalDePalavras = length(strsplit(strjoin(novoRoteiro(:, 2)), ' '));
end