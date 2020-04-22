function MostrarMenuPrincipal ()

    clc;
    close all;

    AbrirJanela('Escolha a Fase');

    CriarBotao('Fase 1', [110 270 100 50],  @IrParaFase);
    CriarBotao('Fase 2', [310 270 100 50], @IrParaFase);
    CriarBotao('Fase 3', [510 270 100 50], @IrParaFase);
    
    CriarBotao('Fase 4', [110 100 100 50],  @IrParaFase);
    CriarBotao('Fase 5', [310 100 100 50], @IrParaFase);
    CriarBotao('Fase 6', [510 100 100 50], @IrParaFase);
    
    function IrParaFase(botao, ~, ~)
        numeroDaFase = sscanf(botao.String, '%*s %d');

        CarregarFase(numeroDaFase);
    end
end