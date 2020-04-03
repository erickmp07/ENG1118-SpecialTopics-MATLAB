function PlotarGraficoIncorreto3 ()

x = 0 : 0.01 : 10;
y = sin(x) .* exp(-x); % valores de y incorretos
plot(x, y, 'r');
ylim([-1 1]);