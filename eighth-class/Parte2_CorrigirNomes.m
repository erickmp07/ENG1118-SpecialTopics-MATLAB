function novoRoteiro = Parte2_CorrigirNomes(roteiro, nomesOriginais, nomesCorrigidos)
    novoRoteiro = roteiro;
    
    for i = 1 : length(nomesOriginais)
        novoRoteiro = strrep(novoRoteiro, nomesOriginais(i), nomesCorrigidos(i));
    end
end