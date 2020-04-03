close all;
clc;
clear;

subplot(2, 2, 1);
t = linspace(-10, 10, 1000);
x = exp(-0.1 .* abs(t)) .* sin(5 .* abs(t));
y = exp(-0.1 .* abs(t)) .* cos(5 .* abs(t));
z = t;
plot3(x, y, z);

subplot(2, 2, 2);
x = [-1 1 -1 1];
y = [1 1 -1 -1];
areas = [100 500 2500 12500];
scatter(x, y, areas);
xlim([-2 2]);
ylim([-2 2]);

subplot(2, 2, 3);
x = linspace(-2, 2, 50);
y = linspace(-2, 2, 50);
[X, Y] = meshgrid(x, y);
Z = 3 .* X .^ 2 + 3 .* Y .^ 2;
surf(X, Y, Z);

subplot(2, 2, 4);
x = linspace(0, 10, 100);
y = sin(x);
plot(x, y);
hold on;
x = [pi/2 (3 * pi) / 2 (5 * pi) / 2];
y = sin(x);
margens = repelem(3, length(y));
errorbar(x, y, margens, 'r*');

saveas(gcf, 'graficos.png');