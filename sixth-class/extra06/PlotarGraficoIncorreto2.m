function PlotarGraficoIncorreto2 ()

x = 0 : 0.01 : 10;
y = sin(5 * x) .* exp(-0.5 * x);
plot(x, y, 'b'); % cor incorreta
ylim([-1 1]);