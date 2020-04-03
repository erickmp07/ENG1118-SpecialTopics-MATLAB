function MostrarImagens( imagem1 , imagem2 , imagem3 , imagem4, ...
                     novaImagem1, novaImagem2, novaImagem3, novaImagem4)

images = {imagem1, imagem2, novaImagem1, novaImagem2, ...
          imagem3, imagem4, novaImagem3, novaImagem4};

figure;

for i = 1 : 8
    image = uint8( images{i} );
    
    subplot(2, 4, i);
    imshow(image);
end

% ajusta posição e tamanho da janela
set( gcf , 'position', [ 0 , 0 , 1000 , 500 ] ); 