function terremotos = CarregarTerremotos(anoInicial, anoFinal, coordenadas)

if nargin < 3
    coordenadas = [-90 90; -180 180];
end
if nargin < 2
    anoFinal = Inf;
end
if nargin < 1
    anoInicial = -Inf;
end

% carrega dados do arquivo tabulado
dados = tdfread('terremotos.tsv');
terremotos = [dados.LATITUDE dados.LONGITUDE dados.EQ_PRIMARY dados.YEAR];

% remove NaN, para não dar problemas nas contas
terremotos(isnan(terremotos)) = 0 ;

% filtra dados por ano
linhas = terremotos(:, 4) >= anoInicial & terremotos(:, 4) <= anoFinal;
terremotos = terremotos(linhas, :);

% filtra dados por coordenadas
linhas = terremotos(:, 1) >= coordenadas(1, 1) & terremotos(:, 1) <= coordenadas(1, 2) ...
        & terremotos(:, 2) >= coordenadas(2, 1) & terremotos(:, 2) <= coordenadas(2, 2);
terremotos = terremotos(linhas, :);

% remove dados de ano
terremotos(:, 4) = [];
