function taxasDeDesemprego = CarregarTaxasDeDesemprego( )

% Fonte: http://www.ipeadata.gov.br/ExibeSerie.aspx?serid=37655&module=M
taxasDeDesemprego = xlsread('DesempregoSP_IPEA.xlsx')';
taxasDeDesemprego = taxasDeDesemprego(end-12*20+1 : end);

end

