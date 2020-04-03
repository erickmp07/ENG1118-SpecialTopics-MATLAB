function PlotarGraficoIncorreto4c ()

x = randi([0 10], 1, 1000); % valores de x incorretos
y = sin(5 * x) .* exp(-0.5 * x);
plot(x, y, 'r');
ylim([-1 1]); 