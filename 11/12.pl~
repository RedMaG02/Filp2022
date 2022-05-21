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



%prost(X,ANSWER):-DEL is X-1, prost(X,ANSWER,DEL).
%prost(_,ANSWER,1):- ANSWER is 0,!.
% prost(X,ANSWER,DEL):- NEWDEL is DEL -1, prost(X,ANSWER1,NEWDEL),DELEN
% is X mod DEL, (DELEN =:= 0 -> ANSWER is ANSWER1 + 1; ANSWER is
% ANSWER1).

prost(X,ANSWER):- prost(X,ANSWER,1,0).
prost(_,ANSWER,_,2):- ANSWER is 2,!.
prost(X,ANSWER,X,KOLVO):- ANSWER is KOLVO,!.
prost(X,ANSWER,DEL,KOLVO):- NEWDEL is DEL + 1, DELEN is X mod DEL,(DELEN=:=0 -> NEWKOLVO is KOLVO + 1; NEWKOLVO is KOLVO), prost(X,ANSWER,NEWDEL,NEWKOLVO).

polinomo(A,B,K):-polinomo(A,B,K,0,1).
polinomo(_,_,K,_,0):-K is 0,!.
polinomo(A,B,K,N,_):- NEWN is N + 1, N2 is N*N, AN is A*N, CHISLO is abs(N2 + AN + B), prost(CHISLO,BOOLK), (BOOLK =:= 1 -> NEWK is K+1,NEWB is 1; NEWK is K, NEWB is 0), polinomo(A,B,NEWK,NEWN,NEWB).

%method13(ANSWER,A,B,P,MAX)
method13(ANSWER):-method13(ANSWER,-999,-999,-1000000,0).
method13(P,999,1000,P,_):-!.
method13(ANSWER,A,1000,P,MAX):- NEWA is A +1, method13(ANSWER,NEWA,-999,P,MAX).
method13(ANSWER,A,B,P,MAX):- NEWB is B+1, polinomo(A,B,K), (K>MAX -> NEWMAX is K, NEWP is A * B; NEWMAX is MAX, NEWP is P), method13(ANSWER,A,NEWB,NEWP,NEWMAX).
