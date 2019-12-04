public_stats :-
%    write('Stats:'),
	findall([U,D,L,R], stats(U,D,L,R), Out).

public_validPath :-
%        write('Valid Path: '),
	findall([N,W], validPath(N,W), Abc).
%	write(Out).

% maze(N,sx,sy,ex,ey) in which n is 

maze(4,0,3,3,2).
cell(0,0,[d],[0.39]).
cell(1,0,[r,d],[16.59, 0.89]).
cell(2,0,[l,d],[0.01, 18.65]).
cell(3,0,[],[]).
cell(0,1,[r],[63.13, 3.15]).
cell(1,1,[u,l,r,d],[0.58, 11.28, 0.012, 25.69]).
cell(2,1,[u,l,r,d],[89.84, 0.12, 0.069, 198.15]).
cell(3,1,[l,d],[0.01, 152.66]).
cell(0,2,[r,d],[0.015, 0.019]).
cell(1,2,[u,l,r],[9.93, 0.20, 1.26]).
cell(2,2,[u,l,d],[12.33, 1.59, 0.68]).
cell(3,2,[u],[18.83]).
cell(0,3,[u],[15.64]).
cell(1,3,[],[]).
cell(2,3,[u,r],[0.22, 0.013]).
cell(3,3,[l],[0.01]).
path('path1',0,3,[u,r,u,l,u]).
path('path2',0,3,[u,r,r,u,l,l,u]).