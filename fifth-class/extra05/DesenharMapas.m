function DesenharMapas( )

mapa = imread('atlas.png');

% ajusta coordenadas da imagem
RI = imref2d(size(mapa));
RI.XWorldLimits = [-180 180];
RI.YWorldLimits = [-90 90];

% espelha mapa verticalmente
mapaEspelhado = flipud(mapa);

for i = 4 : -1 : 1
    % plota mapa em branco em um pedaço da tela
    subplot(2, 2, i);
    hold('on');
    
    if i == 5
        box on;
        view(-5, 75);
        zlim([0, 1]);
        surface('XData',[-180 180; -180 180],'YData',[-90 -90; 90 90],...
        'ZData',[0 0; 0 0],'CData',mapaEspelhado,...
        'FaceColor','texturemap','EdgeColor','none');
    else
        imshow(mapaEspelhado, RI);
    end
    
    xlabel('Longitude');
    ylabel('Latitude');
    xlim([-180, 180]);
    ylim([-90, 90]);
    
    % retorna eixo y ao normal (negativo embaixo, positivo em cima)
    axis xy;
end

% escala de cor azul -> vermelho
colormap jet;

% colocar janela em tela cheia
set(gcf, 'Position', get(0,'Screensize')); 

