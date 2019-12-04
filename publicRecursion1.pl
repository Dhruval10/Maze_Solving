test_prod(L) :- findall(R, prod(L,R), Out), write(Out), nl.

public_prod :-
	nl,
	write('Product: '),nl,
	test_prod([2,3,4]),
	test_prod([]),
	test_prod([2,2,2]).

test_fill1(N,X) :- findall(R, fill(N,X,R), Out), write(Out), nl.
test_fill2(N,R) :- findall(X, fill(N,X,R), Out), write(Out), nl.

public_fill :-
	nl,
	write('Fill: '),
	nl,
	test_fill1(4,2),
	test_fill1(2,3),
	test_fill2(4,[2,2,2,2]),
	test_fill2(2,[3,3]).