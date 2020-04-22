function [mapa, linhaDoPacman, colunaDoPacman] = AtualizarMapa(mapa, ...
    corDoPacman, linhaDoPacman, colunaDoPacman)

conteudo = mapa(linhaDoPacman, colunaDoPacman);
corDoConteudo = rem(conteudo, 10);

if corDoConteudo == corDoPacman
    switch conteudo
        case {21, 22}
            mapa = Fase02_TrocarCores(mapa);
        case {31, 32}
            mapa(linhaDoPacman, colunaDoPacman) = 0;
            [linhaDoPacman, colunaDoPacman] = Fase03_Teletransportar(mapa, linhaDoPacman, colunaDoPacman);
        case {41, 42}
            mapa = Fase04_ApagarCruz(mapa, corDoConteudo, linhaDoPacman, colunaDoPacman);
        case {51, 52}
            mapa = Fase05_ApagarParaTras(mapa, corDoConteudo, linhaDoPacman, colunaDoPacman);
        case {61, 62}
            mapa = Fase06_ApagarRegiao(mapa, linhaDoPacman, colunaDoPacman);
    end

    mapa(linhaDoPacman, colunaDoPacman) = 0;
end