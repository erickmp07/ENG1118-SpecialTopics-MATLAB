function MostrarTelaDeVitoria (numeroDaFase)

    close all;

    if nargin ~= 1
        error('Passe o número da fase!');
    end

    AbrirJanela('Vitória!');

    imagem = imread('Vitoria.png');
    [linhas, colunas, ~] = size(imagem);
    x = (1 : colunas) / 300;
    y = (1 : linhas) / 300;
    image(x, y, imagem);

    mensagem = sprintf('Fase %d Concluída!', numeroDaFase);
    texto = text(1.2, 0.5, mensagem);
    texto.Color = 'white';
    texto.FontSize = 30;

    if exist(['fase0' num2str(numeroDaFase + 1) '.txt'], 'file')
        tituloDoBotao = sprintf('Ir para Fase %d', numeroDaFase + 1);
        CriarBotao(tituloDoBotao, [355 130 210 50], @IrParaProximaFase);
    else
        texto = text(1.6, 0.9, 'Fim de Jogo!');
        texto.Color = 'white';
        texto.FontSize = 22;
    end

    xlim([-0.5 3.5]);
    ylim([-0.3 1.7]);
    axis off;

    function IrParaProximaFase(~, ~, ~)
        CarregarFase(numeroDaFase + 1);
    end

end