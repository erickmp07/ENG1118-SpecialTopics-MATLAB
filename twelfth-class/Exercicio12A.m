clear;
close all;
clc;

% Crie o sistema linear com a função de transferência
numerador = [1 2];
denominador = [1 12 5 14];
H = tf(numerador, denominador);

% Aplique no sistema a entrada x(t) abaixo, com t indo
% de 0 a 15.
dt = 0.05;
t = 0 : 0.01 : 15;
x = sin(15 .* t) .* exp(-0.3 .* t);

subplot(2, 1, 1);
plot(t, x);
title('Entrada x(t)');

subplot(2, 1, 2);
y = lsim(H, x, t);

plot(t, y);
title('Saída y(t)');

% Calcule e plote o módulo da transformada de Fourier
% de x(t) e y(t) numa segunda janela, em telas
% separadas.
xfourier = fft(x);
yfourier = fft(y);

B = 1 / dt;
df = B / (length(x) - 1);
f = -B/2 : df : B/2;

figure;
subplot(2, 1, 1);
xfourierEspelhada = fftshift(xfourier);
plot(f, abs(xfourierEspelhada));
title('Transformada de Fourier de x(t)');
xlabel('Frequência (Hz)');

subplot(2, 1, 2);
yfourierEspelhada = fftshift(yfourier);
plot(f, abs(yfourierEspelhada));
title('Transformada de Fourier de y(t)');
xlabel('Frequência (Hz)');