function totalDeCitacoes = Parte6_ContarCitacoes(roteiro, personagem)
    novoRoteiro = Parte3_FiltrarPorTexto(roteiro, personagem);

    [linhas, ~] = size(novoRoteiro);
    
    totalDeCitacoes = 0;

    for i = 1 : linhas
        totalDeCitacoes = totalDeCitacoes + length(strfind(lower(novoRoteiro{i, 2}), lower(personagem)));
    end
end