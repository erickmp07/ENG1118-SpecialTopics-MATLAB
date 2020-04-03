function novoRoteiro = Parte1_FiltrarPorPersonagem(roteiro, personagem)
    novoRoteiro = roteiro(strcmp(roteiro, personagem), :);
end