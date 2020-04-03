function inundacao = CarregarInundacoes(anoInicial, anoFinal, coordenadas)

if nargin < 3
    coordenadas = [-90 90; -180 180];
end
if nargin < 2
    anoFinal = 2100;
end
if nargin < 1
    anoInicial = 1900;
end

% carregar dados da planilha
inundacao = xlsread('inundacoes.xlsx', 1, '', 'basic');

% filtrar dados pelos anos
primeiroDiaDe1900 = datenum('1-jan-1900', 'dd-mmm-yy');
diaInicial = datenum(['1-jan-', num2str(anoInicial)], 'dd-mmm-yy');
diaFinal = datenum(['31-dec-', num2str(anoFinal)], 'dd-mmm-yy');

dataInicialNaPlanilha = diaInicial - primeiroDiaDe1900;
dataFinalNaPlanilha = diaFinal - primeiroDiaDe1900;

linhasDesejadas = inundacao(:, 1) >= dataInicialNaPlanilha & ...
    inundacao(:, 1) <= dataFinalNaPlanilha;
inundacao = inundacao(linhasDesejadas, :);

% pegar apenas certas colunas
latitudes = inundacao(:, 10);
longitudes = inundacao(:, 9);
magnitudes = inundacao(:, 8);
mortos = inundacao(:, 4);
deslocados = inundacao(:, 5);
% duracoes = inundacao(:, 3);
% areas = inundacao(:, 7);

% substituir magnitudes zeras por um número pequeno, para não dar erro na
% scatter
magnitudes(magnitudes <= 0) = 1e-20;

% juntar certas colunas em uma matriz
inundacao = [latitudes, longitudes, magnitudes, mortos, deslocados];

% filtrar dados pelas coordenadas
linhas = inundacao(:, 1) >= coordenadas(1, 1) & inundacao(:, 1) <= coordenadas(1, 2) ...
        & inundacao(:, 2) >= coordenadas(2, 1) & inundacao(:, 2) <= coordenadas(2, 2);
inundacao = inundacao(linhas, :);