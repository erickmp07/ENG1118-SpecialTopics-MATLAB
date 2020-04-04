function tabelaFiltrada = CarregarDadosDaWEO()

COLUNA_INICIAL_DE_ANOS = 10;
COLUNA_FINAL_DE_ANOS = 46;

TOTAL_DE_LINHAS_POR_PAIS = 45;
LINHAS_DE_INTERESSE = [2 4 10 20 26 28 42];
NOME_DAS_LINHAS_DE_INTERESSE = {'Variacao_do_PIB', 'PIB', 'PIB_per_Capita', ...
    'Inflacao', 'Desemprego', 'Populacao', 'Divida_em_Relacao_ao_PIB'};

tabelaOriginal = readtable('WEOOct2017all.txt');

i = 1;
tabelaFiltrada = table;

for linha = LINHAS_DE_INTERESSE
    textoDosNumeros = tabelaOriginal{linha+1 : TOTAL_DE_LINHAS_POR_PAIS : end-2, COLUNA_INICIAL_DE_ANOS : COLUNA_FINAL_DE_ANOS};
    numeros = cellfun(@str2double, textoDosNumeros);
    tabelaFiltrada.(NOME_DAS_LINHAS_DE_INTERESSE{i}) = numeros;
    i = i + 1;
end

paises = tabelaOriginal{2 : TOTAL_DE_LINHAS_POR_PAIS : end-2, 4};
tabelaFiltrada.Properties.RowNames = paises;

