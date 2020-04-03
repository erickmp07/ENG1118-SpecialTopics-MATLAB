function temperaturas = CarregarTemperaturas2016( )

temperaturas = load('temperaturasMensais2016.txt');
temperaturas = reshape(temperaturas, 360, 180, 12);
temperaturas = permute(temperaturas, [2, 1, 3]);