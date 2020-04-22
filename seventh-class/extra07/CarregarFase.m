function CarregarFase(numeroDaFase)
    clc;
    close all;
    
    COR_AZUL = [0.0 0.4 1.0];
    COR_LARANJA = [1.0 0.5 0.0];
    
    if nargin ~= 1
        numeroDaFase =  1;
%         error('Passe o número da fase!');
    end
    
    teclaAtual = '';

    timerDoJogo = timer;
    timerDoJogo.TimerFcn = @(myTimerObj, thisEvent) LoopDoJogo();
    timerDoJogo.ExecutionMode = 'fixedRate';
    timerDoJogo.Period = 0.09;
    tempoDaAnimacao = 0;
      
    janelaDaFase = AbrirJanela(sprintf('Fase %2d',numeroDaFase));
    janelaDaFase.KeyPressFcn = @LidarComTeclaPressionada;
    janelaDaFase.KeyReleaseFcn = @LidarComTeclaLiberada;
    janelaDaFase.Color = 'white';
    
    CriarBotao('Voltar ao Menu', [50 358 200 42], @VoltarAoMenu);
    CriarBotao('Reiniciar Fase', [500 358 200 42], @ReiniciarFase);
    
    function VoltarAoMenu (~, ~)
        MostrarMenuPrincipal();
    end

    function ReiniciarFase (~, ~)
        CarregarFase(numeroDaFase);
    end
    
    axes('units', 'pix',...
         'position', [0 0 740 360], ...
          'xtick', [], 'ytick',[],...
          'xlim',[0 740],...
          'ylim',[0 360]);

    S.mapa = load(sprintf('fase%.2d.txt', numeroDaFase));
    
    [S.mapa, pacmanAzul, pacmansLaranjas] = CarregarPacmans(S.mapa);
    
    AtualizarGraficoDoMapa(S.mapa);

    LoopDoJogo();
    
    function LoopDoJogo()
        tic;
        vitoria = 0;
        while true
            if ~ishandle(janelaDaFase)
                break;
            end

            if tempoDaAnimacao < 0.1
                tempoDaAnimacao = toc;
            else
                tempoDaAnimacao = 0;
                for pacman = [pacmanAzul pacmansLaranjas]
                    pacman.bocaAberta = ~pacman.bocaAberta;
                end
                tic;
                
                DesenharPacmans();
            end

            for pacman = [pacmanAzul pacmansLaranjas]
                [proximoX, proximoY, angulo, atingiuBorda] = CalcularProximaPosicao(pacman);
                pacman.angulo = angulo;

                [novoMapa, novaLinha, novaColuna] = AtualizarMapa(S.mapa, pacman.cor, proximoY, proximoX);
                if ~isequal(novoMapa, S.mapa)
                    S.mapa = novoMapa;
                    AtualizarGraficoDoMapa(S.mapa);
                end
%                 atingiuBorda
%                 novaLinha
%                 novaColuna
%                 if isempty(novaLinha)
%                     disp hein?
%                 end
                if ~isempty(novaLinha) && ~isempty(novaColuna) && S.mapa(novaLinha, novaColuna) == 0 && ~atingiuBorda
                    pacman.x = novaColuna;
                    pacman.y = novaLinha;
                elseif pacman.cor == 2
                    pacman.angulo = rem(pacman.angulo + pi/2, 2*pi);
                end
            end
            
%             pacmansLaranjas(1).x = pacmansLaranjas(1).x + 1;
            
            DesenharPacmans();
            
            if Fase01_VerificarVitoria(S.mapa)
                vitoria = 1;
                break;
            end
            
            pause(0.1);
        end
        
        if vitoria
            DesenharPacmans();
            PrepararTelaDaVitoria();
        end
    end

    function LidarComTeclaPressionada(~, eventoDeTecla)
        switch eventoDeTecla.Key
            case {'uparrow', 'w', 'downarrow', 's', 'rightarrow', 'd', 'leftarrow', 'a' }
                teclaAtual = eventoDeTecla.Key;
            otherwise
                teclaAtual = '';
        end
    end

    function LidarComTeclaLiberada (~, eventoDeTecla)
        if strcmp(eventoDeTecla.Key, teclaAtual)
            teclaAtual = '';
        end
    end

    function [proximoX, proximoY, angulo, atingiuBorda] = CalcularProximaPosicao(pacman)
        atingiuBorda = 0;
        if pacman.cor == 1
            switch teclaAtual
                case {'uparrow', 'w'}
                    pacman.angulo = 3 * pi / 2;
                case {'downarrow', 's'}
                    pacman.angulo = pi / 2;
                case {'rightarrow', 'd'}
                    pacman.angulo = 0;
                case {'leftarrow', 'a'}
                    pacman.angulo = pi;
            end
        end
        
        angulo = pacman.angulo;
        proximoX = pacman.x;
        proximoY = pacman.y;
        if pacman.cor == 2 || ~strcmp(teclaAtual, '')
            switch angulo
                case 3 * pi / 2
                    if pacman.y > 1
                        proximoY = pacman.y - 1;
                    else
                        atingiuBorda = 1;
                    end
                case pi / 2
                    if pacman.y < size(S.mapa, 1)
                        proximoY = pacman.y + 1;
                    else
                        atingiuBorda = 1;
                    end
                case 0
                    if pacman.x < size(S.mapa, 2)
                        proximoX = pacman.x + 1;
                    else
                        atingiuBorda = 1;
                    end
                case pi
                    if pacman.x > 1
                        proximoX = pacman.x - 1;
                    else
                        atingiuBorda = 1;
                    end
            end
        end
    end

    function DesenharPacmans ()
        DesenharPacmanAzul();
        DesenharPacmansLaranjas();
    end

    function DesenharPacmanAzul () 
        pacmanAzul = DesenharPacman(pacmanAzul, COR_AZUL);
    end

    function DesenharPacmansLaranjas ()
        for i = 1 : length(pacmansLaranjas)
            pacmansLaranjas(i) = DesenharPacman(pacmansLaranjas(i), COR_LARANJA);
        end
    end

    function pacman = DesenharPacman (pacman, cor)
        if pacman.bocaAberta
            t = (1/16 : 1/64 : 59/64)' * 2*pi;
        else
            t = (0 : 1/64 : 64/64)' * 2*pi;
        end
        x = cos(t + pacman.angulo)*0.5 + 1;
        y = sin(t + pacman.angulo)*0.5 + 1;
        x(end + 1) = 1;
        y(end + 1) = 1;
        x = x + pacman.x - 1;
        y = y + pacman.y - 1;
        
        delete(pacman.grafico);
        pacman.grafico = fill(x, y, 'white');
        pacman.grafico.FaceColor = cor;
    end

    function PrepararTelaDaVitoria ()
        pacmanAzul.bocaAberta = 1;
        DesenharPacmans();
        
        timerDaVitoria = timer;
        timerDaVitoria.TimerFcn = @(myTimerObj, thisEvent) MostrarTelaDeVitoria(numeroDaFase);
        timerDaVitoria.StartDelay = 0.5;
        
        start(timerDaVitoria);
    end
end