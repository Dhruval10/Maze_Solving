%%%%%%%%%%%%%%%%%%%%%%
% Part 1 - Recursion %
%%%%%%%%%%%%%%%%%%%%%%

% prod - R is product of entries in list L
prod([], 1).
prod([Hd|Tl],R) :-
	prod(Tl,R1),
	R is R1 * Hd.

% fill - R is list of N copies of X
fill(0, X, []).
fill(N,X,[Hd|Tl]) :-
	N > 0,
	X = Hd,
	N1 is N-1,
	fill(N1, X, Tl).

% genN - R is value between 0 and N-1, in order
 genN(X,F) :- countHelp(X,F,0).

	countHelp(X,F,Z) :-
	Z < X,
	(F = Z ;
	Z1 is Z + 1,
	countHelp(X,F,Z1)).

% genXY - R is pair of values [X,Y] between 0 and N-1, in lexicographic order
genXY(X,F) :- countHelp(X,F,0,0).

	countHelp(X,F,Z,G) :-
	(Z < X ->
	(F = [G,Z] ;
	Z1 is Z + 1,
	countHelp(X,F,Z1,G));
	G+1 < X,
	G1 is G+1,
	countHelp(X,F,0,G1)).

% flat(L,R) - R is elements of L concatentated together, in order
genXY(X,F) :- countHelp(X,F,0,0).

	countHelp(X,F,Z,G) :-
	(Z < X ->
	(F = [G,Z] ;
	Z1 is Z + 1,
	countHelp(X,F,Z1,G));
	G+1 < X,
	G1 is G+1,
	countHelp(X,F,0,G1)).

%%%%%%%%%%%%%%%%%%%%%%%%
% Part 2 - Maze Solver %
%%%%%%%%%%%%%%%%%%%%%%%%

% stats(U,D,L,R) - number of cells w/ openings up, down, left, right
stats(U,D,L,R) :- maze(Size,_,_,_,_),
	 			 findall(R, genXY(Size,R), Out),
	 			
	 			 statsHelp(Out,U, L, R, D).

statsHelp([],0,0,0,0).
statsHelp([[X|[Y]]|Tl],U, L, R, D) :- cell(X,Y,Dirs,Wt),
								(contains1(u,Dirs) -> U1 is 1; U1 is 0),
								(contains1(d,Dirs) -> D1 is 1; D1 is 0),
								(contains1(l,Dirs) -> L1 is 1; L1 is 0),
								(contains1(r,Dirs) -> R1 is 1; R1 is 0),
								statsHelp(Tl,U2, L2, R2, D2),
								
								U is U1 + U2,
								D is D1 + D2,
								R is R1 + R2,
								L is L1 + L2.

contains1(V,[V|Tl]).
contains1(V,[Hd|Tl]):-
					contains1(V,Tl).

% validPath(N,W) - W is weight of valid path N rounded to 4 decimal places
validPath(N,W) :- maze(Size,_,_,_,_),
	 			 path(Name,Sx,Sy,Dir),
	 			 validPathHelp(N,W3,Sx, Sy, Dir, Name),
	 			 round4(W3,W).


validPathHelp(N,0,Sx,Sy,[],Name) :- N = Name.
validPathHelp(N,W,X, Y, [F|Tl], Name) :- cell(X,Y,Dcell,Whd),
										contains1(F,Dcell,Whd,Bam),
										changeDir(X,Y,F,Cx, Cy),
										validPathHelp(N,W123, Cx, Cy, Tl, Name),
										W is Bam + W123.
										

							

contains1(V,[V|Tl],[F1|Fr], Pos2) :- Pos2 is F1.
contains1(V,[Hd|Tl],[S1|S2], Pos2):-
contains1(V,Tl,S2, Pos2).

getWeight([], 0, N).
getWeight([Hd|Tl], Bam, 0) :- Bam is Hd.
getWeight([Hd|Tl], Bam, N) :- N1 is N - 1,
							getWeight(Tl, Bam, N1).


changeDir(X,Y, F, Cx, Cy) :- (F = u -> Cy is Y - 1, Cx is X);
							 (F = d -> Cy is Y + 1, Cx is X);
							 (F = l -> Cx is X - 1, Cy is Y);
							 (F = r -> Cx is X + 1, Cy is Y).
round4(X,Y) :- T1 is X*10000, T2 is round(T1), Y is T2/10000.

% findDistance(L) - L is list of coordinates of cells at distance D from start

findDistance(L) :- maze(_,X,Y,_,_),
                   Q = [[0,[X,Y]]],
                   buildLst(Q,[],[],L1),
                   sort(L1,L2),
                   start(L2,[],R,Z),

                   finish(R,Z,L9),
                   	sort(L9,L).

start([[D,[[X,Y]]] | Tl],[], R, L) :- append([[D,[[X,Y]]]],[],L), R = Tl.

finish([],L,L).
finish([[D,[[X,Y]]] | Tl], [[D,[[Cx,Cy]|Rs]] | Tl2], L) :- !,append([[X,Y]],[[Cx,Cy]],Cell),
																append(Cell,Rs,Cell1),
																sort(Cell1,Cellf),
														append([[D,Cellf]], Tl2, Nk),
														finish(Tl,Nk,L). 
finish([[D,[[X,Y]]] | Tl],Z, L) :- append([[D,[[X,Y]]]],Z,R), finish(Tl,R,L).

buildLst([],P,L,L).
buildLst([[D,[X,Y]] | Tl],P,L1, L) :- cell(X,Y,Dirs,_),
								D1 is D + 1,
								append([[X,Y]],P, P1),
								!,process(D1,X,Y,Dirs,P1,Tl,Lst),
								append([[D,[[X,Y]]]],L1,L2),
								buildLst(Lst,P1,L2,L).


process(D,X,Y,[],P,Q,Q).
process(D,X,Y,[Hd|Tl],P,Q,Qf) :- getCord1(X,Y, Hd, Cx, Cy),
								!,(\+containz([Cx,Cy],P) -> append(Q,[[D,[Cx,Cy]]],Q1), process(D,X,Y, Tl, P, Q1, Qf);
									process(D,X,Y,Tl,P,Q, Qf)).
containz(Cell,[Cell|Tl]).
containz(Cell, [Hd|Tl]) :- containz(Cell, Tl).

% solve - True if maze is solvable, fails otherwise.
maze(Size,Sx,Sy,Ex,Ey),
	Q = [[Sx,Sy]],
	F = [Ex,Ey],
	solveHelp(Q,[],F).

solveHelp([Hd|Tl],P, Hd).
solveHelp([[X|[Y]]|Tl], P, F) :-
			append([[X,Y]], P, P1),
			cell(X,Y,Dirs,_),
			buildQ(X,Y,Dirs,Tl,P1, R),
			solveHelp(R,P1,F).

				
buildQ(X,Y,[],Q,P, Q).
buildQ(X,Y,[Dirs|Dend],Q,P,R) :- getCord1(X,Y,Dirs, Cx, Cy),
							  (\+member([Cx,Cy],P) -> append([[Cx,Cy]], Q, Q1); Q1 = Q),
							  buildQ(X,Y,Dend, Q1, P, R).

getCord1(X,Y,F,Cx,Cy) :- (F = u -> Cy is Y - 1, Cx is X);
							 (F = d -> Cy is Y + 1, Cx is X);
							 (F = l -> Cx is X - 1, Cy is Y);
							 (F = r -> Cx is X + 1, Cy is Y).