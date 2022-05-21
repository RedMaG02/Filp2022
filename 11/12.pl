%nod(A,B,X):-
nod(A,0,A):-!.
nod(A,B,X):- NEWB is A mod B, nod(B,NEWB,X).

%method11(X,K,Y)
method11(X,K):- method11(X,K,X).
method11(_,K,0):- K is 0,!.
method11(X,K,Y):- NEWY is Y-1, method11(X,K1,NEWY), nod(X,Y,NOD), (((NOD \= 1),(Y mod 2 =:= 0 ))-> K is K1 + 1; K is K1).

method112(X,K):- method112(X,K,X,0).
method112(_,CUR,0,CUR):-!.
method112(X,K,Y,CUR):- NEWY is Y-1, nod(X,Y,NOD), (((NOD \= 1),(Y mod 2 =:= 0 ))-> NEWCUR is CUR + 1; NEWCUR is CUR), method112(X,K,NEWY,NEWCUR).


%SumCift<5
sumCifr(0,ANS):- ANS is 0,!.
sumCifr(X,ANS):- NEWX is X div 10, sumCifr(NEWX, ANS1), (X mod 10 < 5 ->ANS is ANS1 + (X mod 10); ANS is ANS1).

%findMinDel
minDel(X,ANS):- minDel(X,ANS,2).
minDel(X,ANS,X):- ANS is X,!.
minDel(X,ANS,Y):- NEWY is Y + 1, minDel(X,ANS1,NEWY), ((X mod Y =:= 0), (Y<ANS1) -> ANS is Y; ANS is ANS1).

method12(X,ANS):- sumCifr(X,SUM), minDel(X,DEL), method12(X,ANS,SUM,DEL,-1,1).
method12(X,ANS,SUM,_,MAX,X):- ANS is SUM * MAX,!.
method12(X,ANS,SUM,DEL,MAX,I):- NEWI is I + 1, nod(X,I,NOD), INDEX is I mod DEL, (((NOD \= 1),(INDEX \= 0),(I > MAX)) -> NEWMAX is I; NEWMAX is MAX ), method12(X,ANS,SUM,DEL,NEWMAX,NEWI).
