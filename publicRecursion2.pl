geneN(N) :- findall(R, genN(N,R), Out).

public_genN:-
%    write('Generate N: '),nl,
	geneN(2),
	geneN(3).

test_genXY(N) :- findall(R, genXY(N,R), Out).

public_genXY :-
%    write('Generate XY: '),nl,
	test_genXY(2),
	test_genXY(3).

test_flat(L) :- findall(R, flat(L,R), Out).

public_flat :-
%    write('Flat :'),nl,
	test_flat([[1],[2,3]]),
	test_flat([1,[2,3]]),
	test_flat([[1,[2]],3]),
	test_flat([[3],[2],[1]]).