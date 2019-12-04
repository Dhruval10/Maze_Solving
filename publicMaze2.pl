public_findDistance :-
    nl,
    write('Path :'),
	findall(L, findDistance(L), Out), 
	write(Out).

public_solve :-
    write('Solve: '),
	findall(true, solve, Out), 
	write(Out).

maze(4,0,3,3,2).
cell(0,0,[d],[0.39]).
cell(1,0,[r,d],[16.60, 0.89]).
cell(2,0,[l,d],[0.011, 18.65]).
cell(3,0,[],[]).
cell(0,1,[u,r],[0.13, 3.15]).
cell(1,1,[u,l,r,d],[0.58, 11.28, 0.012, 25.69]).
cell(2,1,[u,l,r,d],[89.84, 0.12, 0.069, 198.15]).
cell(3,1,[l,d],[0.011, 132.66]).
cell(0,2,[r,d],[0.014, 0.019]).
cell(1,2,[u,l,r],[9.93, 0.19, 1.26]).
cell(2,2,[u,l,d],[12.33, 1.59, 0.68]).
cell(3,2,[u],[18.82]).
cell(0,3,[u],[15.64]).
cell(1,3,[],[]).
cell(2,3,[u,r],[0.21, 0.013]).
cell(3,3,[l],[0.0113]).
path('path1',0,3,[u,r,u,l,u]).
path('path2',0,3,[u,r,r,u,l,l,u]).