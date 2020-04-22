function janela = AbrirJanela(nome)

COMPRIMENTO = 740;
ALTURA = 400;

dimensoesDaTela = get(0, 'ScreenSize');
alturaDaTela = dimensoesDaTela(4);

janela = figure();
janela.Units = 'pixels';
janela.Position = [10 alturaDaTela-ALTURA-30 COMPRIMENTO ALTURA];
janela.Name = nome;
janela.MenuBar = 'none';
janela.NumberTitle = 'off';
janela.KeyPressFcn = @(~,~) 0;
janela.Color = [0 0 0];