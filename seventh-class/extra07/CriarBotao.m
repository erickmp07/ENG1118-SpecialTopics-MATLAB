function botao = CriarBotao (titulo, posicao, callback)
    botao = uicontrol('unit', 'pix');
    botao.Style = 'pushbutton';
    botao.Position = posicao;
    
    botao.String = titulo;
    botao.FontWeight = 'bold';
    botao.FontSize = 18;
    botao.FontName = 'Arial';
    botao.Callback = callback;
end