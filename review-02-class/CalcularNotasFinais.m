function [ vetor ] = CalcularNotasFinais( tabela )
[linha, ~] = size(tabela);

vetor = repelem(0, linha);

for i = 1 : linha
    n1 = (tabela.P1(i) + tabela.P2(i)) / 2;
    if tabela.P1(i) >= 3.0 && tabela.P2(i) >= 3.0 && n1 >= 6.0
        nf = n1;
    else
        nf = (tabela.P1(i) + tabela.P2(i) + tabela.P3(i) * 2) / 4;
    end
    
    vetor(i) = nf;
end

vetor = vetor';
end

