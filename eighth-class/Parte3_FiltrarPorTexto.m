function novoRoteiro = Parte3_FiltrarPorTexto(roteiro, textoDeBusca)
    novoRoteiro = roteiro;
    
    [linhas, ~] = size(novoRoteiro);
    
    resultado = [];

    for i = 1 : linhas
        %if ~isempty (strfind(lower(roteiro{i, 1}), lower(textoDeBusca)))
            %resultado = [resultado i];
        %elseif ~isempty (strfind(lower(roteiro{i, 2}), lower(textoDeBusca)))
        if ~isempty (strfind(lower(roteiro{i, 2}), lower(textoDeBusca)))
            resultado = [resultado i];
        end
    end
    
    novoRoteiro = roteiro(resultado, :);
end