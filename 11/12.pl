%nod(A,B,X):-
nod(A,0,A):-!.
nod(A,B,X):- NEWB is A mod B, nod(B,NEWB,X).

%method11(X,K,Y)
method11(X,K):- method11(X,K,X).
method11(_,K,0):- K is 0,!.
method11(X,K,Y):- NEWY is Y-1, method11(X,K1,NEWY), nod(X,Y,NOD), (((NOD \= 1),(Y mod 2 =:= 0 ))-> K is K1 + 1; K is K1).
