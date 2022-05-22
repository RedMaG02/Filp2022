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
prost(1,ANSWER,1,_):- ANSWER is 1,!.
prost(X,ANSWER,X,KOLVO):- ANSWER is KOLVO,!.
prost(X,ANSWER,DEL,KOLVO):- NEWDEL is DEL + 1, DELEN is X mod DEL,(DELEN=:=0 -> NEWKOLVO is KOLVO + 1; NEWKOLVO is KOLVO), prost(X,ANSWER,NEWDEL,NEWKOLVO).

polinomo(A,B,K):-polinomo(A,B,K,0,1,0).
polinomo(_,_,K,_,0,KO):-K is KO,!.
polinomo(A,B,K,N,_,KO):- NEWN is N + 1, N2 is N*N, AN is A*N, CHISLO is abs(N2 + AN + B), prost(CHISLO,BOOLK), (BOOLK =:= 1 -> NEWK is KO+1, NEWB is 1; NEWK is KO, NEWB is 0), polinomo(A,B,K,NEWN,NEWB,NEWK).

%method13(ANSWER,A,B,P,MAX)
method13(ANSWER):-method13(ANSWER,-999,-999,-1000000,0).
method13(P,999,1000,P,_):-!.
method13(ANSWER,A,1000,P,MAX):- NEWA is A +1, method13(ANSWER,NEWA,-999,P,MAX).
method13(ANSWER,A,B,P,MAX):- NEWB is B+1, polinomo(A,B,K), (K>MAX -> NEWMAX is K, NEWP is A * B; NEWMAX is MAX, NEWP is P), method13(ANSWER,A,NEWB,NEWP,NEWMAX).


%method14
listLenght(LIST,ANSWER):- listLenght(LIST,ANSWER,0).
listLenght([],ANSWER,L):-ANSWER is L,!.
listLenght([_|T],ANSWER,L):-NEWL is L + 1, listLenght(T,ANSWER,NEWL).

%readList
readList(N,LIST):- readList(N,LIST,[]).
readList(0,LIST,GETLIST):-LIST is GETLIST,!.
readList(N,LIST,GETLIST):- NEWN is N-1, read(X), append(GETLIST,[X],GETLIST1), readList(NEWN,LIST,GETLIST1).

writeList([]):-!.
writeList([H|T]):- write(H),write(' '), writeList(T).


findMax([H|T],X):- findMax(T,X,H).
findMax([],X,MAX):- X is MAX,!.
findMax([H|T],X,MAX):- (H>MAX -> NEWMAX is H; NEWMAX is MAX), findMax(T,X,NEWMAX).

getByIndex([H|_],0,X):- X is H,!.
getByIndex([_|T],N,X):-NEWN is N-1, getByIndex(T,NEWN,X).

method53(LIST,N):- findMax(LIST,X), getByIndex(LIST,N,Y), (X=:=Y-> write(da);write(net)),!.


findMin([H|T],X):- findMin(T,X,H).
findMin([],X,MIN):- X is MIN,!.
findMin([H|T],X,MIN):- (H<MIN -> NEWMIN is H; NEWMIN is MIN), findMin(T,X,NEWMIN).

findIndexByMax([H|T], ANSWER):- findIndexByMax(T,ANSWER,0,H,0).
findIndexByMax([],ANSWER,_,_,IMAX):- ANSWER is IMAX,!.
findIndexByMax([H|T],ANSWER,I,MAX,IMAX):- NEWI is I + 1, (H>MAX -> NEWMAX is H, NEWIMAX is NEWI; NEWMAX is MAX, NEWIMAX is IMAX), findIndexByMax(T,ANSWER,NEWI,NEWMAX,NEWIMAX).

destroyMaxByIndex(LIST,INDEX,ANSWERLIST):- findMin(LIST, MINIMAL1), MINIMAL is MINIMAL1 - 1, destroyMaxByIndex(LIST,INDEX,ANSWERLIST,[],MINIMAL).
destroyMaxByIndex([_|T],0,ANSWERLIST,LISTBEFORE,MINIMAL):- append([MINIMAL],T,ANS), append(LISTBEFORE,ANS,ANSWER), ANSWERLIST = ANSWER,!.
destroyMaxByIndex([H|T],INDEX,ANSWERLIST,LISTBEFORE,MINIMAL):- NEWINDEX is INDEX - 1, append(LISTBEFORE,[H],NEWLISTBEFORE), destroyMaxByIndex(T,NEWINDEX,ANSWERLIST,NEWLISTBEFORE,MINIMAL).

method64(LIST,ANSWERLIST):-findMax(LIST,MAXIMUM),findMin(LIST,MIN), MINIMUM is MIN - 1, method64(LIST,ANSWERLIST,[],MINIMUM,MAXIMUM).
method64(_,ANSWERLIST,GETLIST,MINIMUM,MINIMUM):- ANSWERLIST = GETLIST,!.
method64(LIST,ANSWERLIST,GETLIST,MINIMUM,_):- findIndexByMax(LIST,INDEX), destroyMaxByIndex(LIST,INDEX,NEWLIST), findMax(NEWLIST,NEWMAX), append(GETLIST,[INDEX],NEWGETLIST), method64(NEWLIST,ANSWERLIST,NEWGETLIST,MINIMUM,NEWMAX).


method714(LIST,A,B,ANSWER):- method714(LIST,A,B,0,ANSWER).
method714([],_,_,COUNT,ANSWER):- ANSWER = COUNT,!.
method714([H|T],A,B,COUNT,ANSWER):-((H<B),(H>A) -> NEWCOUNT is COUNT + 1;NEWCOUNT is COUNT), method714(T,A,B,NEWCOUNT,ANSWER).


find2Max([H,H1|T],ANSWER1,ANSWER2):- (H>H1 -> MAX1 = H,MAXI1 = 0,MAX2 = H1, MAXI2 = 1;MAX1 = H1,MAXI1 = 1, MAX2 = H, MAXI2 = 0), find2Max(T,ANSWER1,ANSWER2,MAX1,MAX2,MAXI1,MAXI2,2).
find2Max([],ANSWER1,ANSWER2,_,_,MAXI1,MAXI2,_):- ANSWER1 = MAXI1, ANSWER2 = MAXI2,!.
find2Max([H|T],ANSWER1,ANSWER2,MAX1,MAX2,MAXI1,MAXI2,CURI):-NEWCURI is CURI + 1, (H>MAX1 -> NEWMAX1 = H, NEWMAXI1 = CURI, NEWMAX2 = MAX1, NEWMAXI2 = MAXI1;(H>MAX2 -> NEWMAX1 = MAX1,NEWMAXI1 = MAXI1, NEWMAX2 = H,NEWMAXI2 = CURI; NEWMAX1 = MAX1,NEWMAXI1 = MAXI1, NEWMAX2 = MAX2,NEWMAXI2 = MAXI2)), find2Max(T,ANSWER1,ANSWER2,NEWMAX1,NEWMAX2,NEWMAXI1,NEWMAXI2,NEWCURI).

method816(LIST,ANSWER):- find2Max(LIST,MAX1,MAX2), method816(LIST,ANSWER,MAX1,MAX2).
method816(_,ANSWER,MAX1,MAX2):- ANSWER is (abs(MAX1 - MAX2) - 1),!.


getABList(LIST,A,B,ANSWERLIST):-getABList(LIST,A,B,ANSWERLIST,[]).
getABList([],_,_,ANSWERLIST,TEMPLIST):- ANSWERLIST = TEMPLIST,!.
getABList([H|T],A,B,ANSWERLIST,TEMPLIST):- append(TEMPLIST,[H],ALIST), ((H>A),(H<B)-> NEWTEMPLIST = ALIST;NEWTEMPLIST = TEMPLIST), getABList(T,A,B,ANSWERLIST,NEWTEMPLIST).

method925(LIST,A,B,ANSWER):- getABList(LIST,A,B,ABLIST), findMax(ABLIST,MAX), ANSWER = MAX,!.


findIndexByMax2([H|T], ANSWER ):-findMax([H|T],MAX),findIndexByMax([H|T],INDEX),findIndexByMax2(T,ANSWER,MAX,INDEX,0).
findIndexByMax2([],ANSWER,_,INDEX,_):- ANSWER = INDEX,!.
findIndexByMax2([H|T],ANSWER,MAX,INDEX,CURI):- NEWCURI is CURI + 1, ((H=:=MAX),(CURI>INDEX) -> NEWINDEX = NEWCURI;NEWINDEX = INDEX), findIndexByMax2(T,ANSWER,MAX,NEWINDEX,NEWCURI).

method1028(LIST,ANSWER):- findIndexByMax(LIST,MAX1),findIndexByMax2(LIST,MAX2), method816(LIST,ANSWER,MAX1,MAX2).
method1028(_,ANSWER,MAX1,MAX2):- ANSWER is (abs(MAX1 - MAX2) - 1),!.
