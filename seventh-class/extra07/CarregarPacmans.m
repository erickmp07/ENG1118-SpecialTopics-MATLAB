function [mapa, pacmanAzul, pacmansLaranjas] = CarregarPacmans( mapa )

[linhasDeNegativos, colunasDeNegativo] = find(mapa < 0);

pacmansLaranjas = [];

for i = 1 : length(linhasDeNegativos)
    linhaDeNegativo = linhasDeNegativos(i);
    colunaDeNegativo = colunasDeNegativo(i);
    
    pacman = Pacman();
    pacman.x = colunaDeNegativo;
    pacman.y = linhaDeNegativo;
    pacman.bocaAberta = 1;
    pacman.grafico = [];
    
    direcao = mapa(linhaDeNegativo, colunaDeNegativo);
    
    if direcao > -5
        pacman.angulo = (direcao + 1) * pi / 2;
        pacman.cor = 1;
        pacmanAzul = pacman;
    else
        pacman.angulo = (direcao + 8) * pi / 2;
        pacman.cor = 2;
        pacmansLaranjas = [pacmansLaranjas pacman];
    end
end

mapa(mapa < 0) = 0;

