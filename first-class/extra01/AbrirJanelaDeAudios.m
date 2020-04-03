function AbrirJanelaDeAudios (audioDosInstrumentos, audioDaVoz)

TAXA_DE_AMOSTRAGEM = 44110;
TEMPO_TOTAL = 16;

audios = {audioDosInstrumentos, audioDaVoz};

for i = [1, 2]
    audio = audios{ i };
    
    subplot(2, 1, i);
    t = 0 : (1/TAXA_DE_AMOSTRAGEM) : (length(audio) - 1) / TAXA_DE_AMOSTRAGEM;
    plot(t, audio);
    
    if i == 1
        title('Instrumentos');
    else
        title('Voz');
    end
    xlabel('Tempo (s)');
    xlim([0, TEMPO_TOTAL]);
    ylim([-1.2, 1.2]);
end

% diferenca = length(audioDosInstrumentos) - length(audioDaVoz);
% if diferenca > 0
%     audio = audioDosInstrumentos + [audioDaVoz, zeros(1, diferenca)];
% else
%     audio = [audioDosInstrumentos, zeros(1, -diferenca)] + audioDaVoz;
% end
% 
% audiowrite('extra/resultado.wav', audio, TAXA_DE_AMOSTRAGEM);

sound( audioDosInstrumentos, TAXA_DE_AMOSTRAGEM);
sound( audioDaVoz, TAXA_DE_AMOSTRAGEM);