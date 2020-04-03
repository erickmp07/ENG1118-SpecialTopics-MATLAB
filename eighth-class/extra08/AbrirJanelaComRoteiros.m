function AbrirJanelaComRoteiros ()
    roteiroAtual = {};

    dimensoesDaTela = get(0, 'ScreenSize');
    alturaDaTela = dimensoesDaTela(4);
    COMPRIMENTO = 1000;
    ALTURA = 500;

    janela = figure;
    janela.Units = 'pixels';
    janela.Position = [10 alturaDaTela-ALTURA-30 COMPRIMENTO ALTURA];
    janela.MenuBar = 'none';
    janela.ToolBar = 'none';
    janela.Resize = 'off';
    janela.Name = 'Star Wars';
    janela.NumberTitle = 'off';
    
    tabela = uitable(janela);
    tabela.Position = [20 20 720 400]; 
    tabela.RowName = [];
    tabela.ColumnName = {'Personagem','Fala'};
    tabela.ColumnEditable = [];
    tabela.ColumnWidth = {100 600};
    tabela.FontSize = 12;
    
    filmes = uicontrol(janela);
    filmes.Style = 'popup';
    filmes.String = {'Episodio IV: Uma Nova Esperanca' ...
        'Episodio V: O Imperio Contra-Ataca' ...
        'Episodio VI: O Retorno de Jedi' ...
        'Episodio VII: O Despertar da Forca'};
    filmes.Position = [375 420 250 50];
    filmes.FontSize = 12;
    filmes.Callback = @(~, ~) CarregarRoteiro(false);
%     CarregarRoteiro(false);
    
    painelDeBusca = uipanel();
    painelDeBusca.Title = 'Busca';
    painelDeBusca.FontSize = 12;
    painelDeBusca.Position = [.75 .49 .23 .36];
    
    labelDosPersonagens = uicontrol(painelDeBusca);
    labelDosPersonagens.Style = 'text';
    labelDosPersonagens.String = 'Personagens';
    labelDosPersonagens.HorizontalAlignment = 'left';
    labelDosPersonagens.Position = [10 117 200 35];
    labelDosPersonagens.FontSize = 12;
    
    personagens = uicontrol(painelDeBusca);
    personagens.Style = 'popup';
    personagens.String = {'(todos os personagens)' 'LUKE' 'C3PO' 'HAN' 'LEIA' 'LANDO' 'VADER'};
    personagens.Position = [6 79 210 50];
    personagens.FontSize = 12;
    
    labelDoTextoDeBusca = uicontrol(painelDeBusca);
    labelDoTextoDeBusca.Style = 'text';
    labelDoTextoDeBusca.String = 'Texto no Dialogo';
    labelDoTextoDeBusca.HorizontalAlignment = 'left';
    labelDoTextoDeBusca.Position = [10 60 200 35];
    labelDoTextoDeBusca.FontSize = 12;
    
    textoDeBusca = uicontrol(painelDeBusca);
    textoDeBusca.Style = 'edit';
    textoDeBusca.HorizontalAlignment = 'left';
    textoDeBusca.Position = [10 50 200 25];
    textoDeBusca.FontSize = 12;
    
    botaoDeBusca = uicontrol(painelDeBusca);
    botaoDeBusca.Style = 'pushbutton';
    botaoDeBusca.String = 'Buscar';
    botaoDeBusca.Position = [140 8 70 35];
    botaoDeBusca.FontSize = 12;
    
    botaoDeBusca.Callback = @(~, ~) CarregarRoteiro(false);
    
    botaoDeCorrigir = uicontrol(janela);
    botaoDeCorrigir.Style = 'pushbutton';
    botaoDeCorrigir.String = 'Corrigir Nomes dos Personagens';
    botaoDeCorrigir.Position = [750 190 230 35];
    botaoDeCorrigir.FontSize = 12;
    botaoDeCorrigir.Callback = @(~, ~) CarregarRoteiro(true);
    
    
    painelDeBusca2 = uipanel();
    painelDeBusca2.Title = 'Estatisticas';
    painelDeBusca2.FontSize = 12;
    painelDeBusca2.Position = [.75 .04 .23 .3];
    
    labelDeLinhas = uicontrol(painelDeBusca2);
    labelDeLinhas.Style = 'text';
    labelDeLinhas.HorizontalAlignment = 'left';
    labelDeLinhas.Position = [10 60 200 35];
    labelDeLinhas.FontSize = 12;
    
    labelDePalavras = uicontrol(painelDeBusca2);
    labelDePalavras.Style = 'text';
    labelDePalavras.HorizontalAlignment = 'left';
    labelDePalavras.Position = [10 45 200 35];
    labelDePalavras.FontSize = 12;
    
    labelDeCitacoes = uicontrol(painelDeBusca2);
    labelDeCitacoes.Style = 'text';
    labelDeCitacoes.HorizontalAlignment = 'left';
    labelDeCitacoes.Position = [10 30 200 35];
    labelDeCitacoes.FontSize = 12;
    
    personagens2 = uicontrol(painelDeBusca2);
    personagens2.Style = 'popup';
    personagens2.String = {'(escolha o personagem)' 'C-3PO' 'VADER' 'LEIA' 'LUKE' 'HAN' 'LANDO' 'POE' 'KYLO REN' 'FINN' 'REY' 'MAZ' 'SNOKE'};
    personagens2.Position = [6 70 210 50];
    personagens2.FontSize = 12;
    personagens2.Callback = @(~, ~) CarregarEstatisticas();
    
    CarregarRoteiro(false);
    
    function CarregarRoteiro(substituirNomes)
        episodio = filmes.Value + 3;
        dadosDoArquivo = load(['extra08/starWars' num2str(episodio) '.mat']);
        roteiroAtual = dadosDoArquivo.roteiro;
        
        if substituirNomes
            nomesOriginais = {'FN-2187', 'THREEPIO', 'Threepio', 'ARTOO', 'Artoo', 'Detoo'};
            nomesCorrigidos = {'FINN', 'C-3PO', '3PO', 'R2', 'R2', 'D2'};
            roteiroAtual = Parte2_CorrigirNomes(roteiroAtual, nomesOriginais, nomesCorrigidos);
        end
        
        AtualizarRoteiro(roteiroAtual, tabela, personagens, textoDeBusca.String)
    end

    function CarregarEstatisticas()
        nomes = personagens2.String;
        personagem = nomes{personagens2.Value};
        
        linhas = Parte4_ContarLinhas(roteiroAtual, personagem);
        palavras = Parte5_ContarPalavras(roteiroAtual, personagem);
        citacoes = Parte6_ContarCitacoes(roteiroAtual, personagem);
        
        labelDeLinhas.String = sprintf('Total de linhas: %d', linhas);
        labelDePalavras.String = sprintf('Total de palavras: %d', palavras);
        labelDeCitacoes.String = sprintf('Total de citacoes: %d', citacoes);
    end
    
end
    