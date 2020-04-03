function AtualizarRoteiro(roteiro, tabela, personagens, textoDeBusca)

nomes = personagens.String;
personagem = nomes{personagens.Value};

if ~strcmp(personagem, '(todos os personagens)')
    roteiro = Parte1_FiltrarPorPersonagem(roteiro, personagem);
end

if ~isempty(textoDeBusca)
    roteiro = Parte3_FiltrarPorTexto(roteiro, textoDeBusca);
end

tabela.Data = roteiro;