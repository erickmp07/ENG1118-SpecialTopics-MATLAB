function [ textoFormatado ] = formatarTexto( texto )
    textoFormatado = ['(' texto(1 : 2) ') ' texto(3 : 6) '-' texto(7 : end)];
end

