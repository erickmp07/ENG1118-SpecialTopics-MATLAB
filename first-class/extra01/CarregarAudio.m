function audio = CarregarAudio(nomeDoAudio, usarStereo)

if nargin == 1
    usarStereo = 0;
end

audio = audioread(nomeDoAudio)';

if ~usarStereo
    audio = mean(audio);
end