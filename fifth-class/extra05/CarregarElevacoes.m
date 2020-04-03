function elevacoes = CarregarElevacoes()

elevacoes = load('elevacoes.txt');
elevacoes = flipud(elevacoes);

elevacoes(:, end + 1) = elevacoes(:, end);
elevacoes(end + 1, :) = elevacoes(end, :);