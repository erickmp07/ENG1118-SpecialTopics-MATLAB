function AtualizarGraficoDoMapa(matrizDoMapa)

graficoDoFundo = [];

janela = figure(1);
curvas = janela.Children(3).Children;
for curva = curvas'
    if isa(curva, 'matlab.graphics.primitive.Image')
        graficoDoFundo = curva;
    elseif isa(curva, 'matlab.graphics.chart.primitive.Line')
        delete(curva);
    end
end

posicoesDosItens = find(matrizDoMapa >= 11)';

% copiaDaMatrizDoMapa = rem(matrizDoMapa, 10) + 1;

copiaDaMatrizDoMapa = matrizDoMapa;
elementosPermitidos = [0 1 2 21 22 31 32 33 41 42 51 52 61 62 71 72 81 82];
posicoesRuins = ~ismember(matrizDoMapa, elementosPermitidos);
copiaDaMatrizDoMapa(copiaDaMatrizDoMapa > 2) = 0;
copiaDaMatrizDoMapa(posicoesRuins) = 3;
copiaDaMatrizDoMapa = copiaDaMatrizDoMapa + 1;

if isobject(graficoDoFundo)
    graficoDoFundo.CData = copiaDaMatrizDoMapa;
else
    imshow(copiaDaMatrizDoMapa, ...
        [0.0  0.0  0.0;
         0.0  0.4  1.0;
         1.0  0.5  0.0;
         0.5  0.5  0.5] ...
    );
end

hold on;

for posicaoDoItem = posicoesDosItens
    [linha, coluna] = ind2sub(size(matrizDoMapa), posicaoDoItem);
    item = matrizDoMapa(posicaoDoItem);
    
    ponto = plot(coluna, linha);
    ponto.MarkerSize = 16;
    ponto.LineWidth = 3;
    
%     ponto.Color = 'white';
    corDoItem = rem(item, 10);
    if corDoItem == 1
        ponto.Color = [0.0 0.4 1.0];
    elseif corDoItem == 2
        ponto.Color = [1.0 0.5 0.0];
    else
        ponto.Color = [0.0 0.8 0.0];
    end
    
    switch item
        case {21, 22}
            ponto.Marker = 'o';
        case {31, 32}
            ponto.Marker = 'd';
        case {33}
            ponto.Marker = 'x';
        case {41, 42}
            ponto.Marker = '+';
        case {51, 52}
            ponto.Marker = '<';
        case {61, 62}
            ponto.Marker = '*';
    end
end