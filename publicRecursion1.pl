test_prod(L) :- findall(R, prod(L,R), Abc).

public_prod :-
%	write('Product: ')
	test_prod([2,3,4]),
	test_prod([]),
	test_prod([2,2,2]).

test_fill1(N,X) :- findall(R, fill(N,X,R), Abc).
test_fill2(N,R) :- findall(X, fill(N,X,R), Abc).

%test_fill1(N,X) :- findall(R, fill(N,X,R), Abc), write(Out), nl.

public_fill :-
%	write('Fill: '),
	test_fill1(4,2),
	test_fill1(2,3),
	test_fill2(4,[2,2,2,2]),
	test_fill2(2,[3,3]).