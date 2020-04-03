function MostrarResultados (varargin)

for numeroDaVariavel = 1 : nargin
    variavel = varargin{numeroDaVariavel};
    fprintf('%s =\n', inputname(numeroDaVariavel));
    disp(variavel);
end