function AbrirJanelaDeAudio (audio)

TAXA_DE_AMOSTRAGEM = 44110;
TEMPO_TOTAL = 25;

t = 0 : (1/TAXA_DE_AMOSTRAGEM) : (length(audio) - 1) / TAXA_DE_AMOSTRAGEM;
plot(t, audio);

title('Audio');
xlabel('Tempo (s)');
xlim([0, TEMPO_TOTAL]);
ylim([-1.2, 1.2]);

sound(audio, TAXA_DE_AMOSTRAGEM);