append1([],X,X).
append1([X|T],Y,[X|T1]) :- append1(T,Y,T1).

readList(N,LIST):- readList(N,LIST,[]).
readList(0,LIST,GETLIST):-LIST = GETLIST,!.
readList(N,LIST,GETLIST):- NEWN is N-1, read(X), append1(GETLIST,[X],GETLIST1), readList(NEWN,LIST,GETLIST1).

writeList([]):-!.
writeList([H|T]):- write(H),write(' '), writeList(T).


getListWithoutNeChetn(LIST,ANSWERLIST):- getListWithoutNeChetn(LIST,ANSWERLIST,[]).
getListWithoutNeChetn([],ANSWERLIST,TEMPLIST):-ANSWERLIST = TEMPLIST,!.
getListWithoutNeChetn([H|T],ANSWERLIST,TEMPLIST):- CHECK is H mod 2, (CHECK =:= 0 ->append1(TEMPLIST,[H],NEWTEMPLIST); NEWTEMPLIST = TEMPLIST), getListWithoutNeChetn(T,ANSWERLIST,NEWTEMPLIST).

findMin([H|T],X):- findMin(T,X,H).
findMin([],X,MIN):- X is MIN,!.
findMin([H|T],X,MIN):- (H<MIN -> NEWMIN is H; NEWMIN is MIN), findMin(T,X,NEWMIN).

method140(MIN):- read(N),readList(N,LIST),getListWithoutNeChetn(LIST,NEWLIST), findMin(NEWLIST,MINIMUM), MIN = MINIMUM.


getPositiveNegativeList(LIST,ANSWERLIST):- getPositiveNegativeList(LIST,ANSWERLIST,[],[]).
getPositiveNegativeList([],ANSWERLIST,POSITIVE,NEGATIVE):- append1(POSITIVE,NEGATIVE,NEWLIST), ANSWERLIST = NEWLIST,!.
getPositiveNegativeList([H|T],ANSWERLIST,POSITIVELIST,NEGATIVELIST):- (H<0 -> append1(NEGATIVELIST,[H],NEWNEGATIVELIST),NEWPOSITIVELIST = POSITIVELIST; append1(POSITIVELIST,[H],NEWPOSITIVELIST),NEWNEGATIVELIST = NEGATIVELIST), getPositiveNegativeList(T,ANSWERLIST,NEWPOSITIVELIST,NEWNEGATIVELIST).

method246:- read(N), readList(N,LIST), getPositiveNegativeList(LIST,NEWLIST), writeList(NEWLIST).
