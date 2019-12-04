
% Uncomment following line to automatically include logic.pl
% :- initialization(['logic.pl']).

testVarsOf([]).
testVarsOf([F|T]) :- 
	write(F), 
	write(' = '),
	findall(C,varsOf(F,C),R),
	sort(R,R1),
	writeln(R1), 
	testVarsOf(T). 

public_varsOf :- 
    nl,
    writeln('Vars Of'),
	formulaList(L),
	testVarsOf(L).

formulaList([t,f,[and, x, y],[or, y, x],[no, x]]).

assignmentList([[],[x]]).