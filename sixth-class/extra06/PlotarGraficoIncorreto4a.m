function PlotarGraficoIncorreto4a ()

x = 0 : 0.5 : 10; % valores de x incorretos
y = sin(5 * x) .* exp(-0.5 * x);
plot(x, y, 'r');
ylim([-1 1]); 