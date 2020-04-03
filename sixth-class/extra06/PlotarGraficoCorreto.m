function PlotarGraficoCorreto ()

x = 0 : 0.004 : 10;
y = sin(5 * x) .* exp(-0.5 * x);
plot(x, y, 'r');
ylim([-1 1]);