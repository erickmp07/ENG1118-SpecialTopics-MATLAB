function notas = GerarNotas ()

% quantidades
numeroDeDisciplinas = 6;
numeroDeAlunos = randi([20 30], 1);
numeroDeProvas = 3;

% gera notas aleatórias usando distribuição de t de student com uma nota
% base diferente para cada aluno
notasBaseDeCadaAluno = randi([4 9], 1, numeroDeAlunos);
notasBase = repmat(notasBaseDeCadaAluno, numeroDeDisciplinas, 1, numeroDeProvas);

if exist('random', 'file')
    variacaoDasNotas = random('t', Inf, numeroDeDisciplinas, numeroDeAlunos, numeroDeProvas);
else
    variacaoDasNotas = 4 * rand(numeroDeDisciplinas, numeroDeAlunos, numeroDeProvas) - 2;
end

notas = notasBase + variacaoDasNotas;

% notas escolares vão de 0 a 10, e têm apenas 1 casa decimal
notas = max(0, min(notas, 10));
notas = round(notas, 1);