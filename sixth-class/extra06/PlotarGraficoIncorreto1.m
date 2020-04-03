function PlotarGraficoIncorreto1 ()

x = 0 : 0.01 : 10;
y = sin(5 * x) .* exp(-0.5 * x);
plot(x, y, 'r');
ylim([-0.2 0.2]); % limites y incorretos