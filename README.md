# Maze_Solving
Prolog Project

## How to run it?
   -  run goTest.pl file

| Character | Variable used |
| -- | -- |
| L | List of ints |
| R | Product of elements of L |
| U | Number of cells with openings up |
| D | Number of cells with openings down |

In prod(L,R),  R=1 if L=[] 

fill(N,X,R) which denotes that a list containing N copies of X.

genN(N,R) in N = non zero positive integer, and R = integer values between 0 and N - 1.

genXY(2,R). then R = [0,0], R = [0,1], R= [1,0], R=[1,1].
