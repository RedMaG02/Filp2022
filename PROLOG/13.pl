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

%1 - prost
prost(X,ANSWER):- prost(X,ANSWER,1,0).
prost(1,ANSWER,1,_):- ANSWER is 1,!.
prost(X,ANSWER,X,KOLVO):- ANSWER is KOLVO,!.
prost(X,ANSWER,DEL,KOLVO):- NEWDEL is DEL + 1, DELEN is X mod DEL,(DELEN=:=0 -> NEWKOLVO is KOLVO + 1; NEWKOLVO is KOLVO), prost(X,ANSWER,NEWDEL,NEWKOLVO).

pow1(X,I,RESULT):- pow1(X,I,RESULT,1).
pow1(_,0,RESULT,POW):- RESULT is POW,!.
pow1(X,I,RESULT,POW):- NEWI is I-1, NEWPOW is POW * X, pow1(X,NEWI,RESULT,NEWPOW).

amountOfDividers(X,PR,RESULT):-amountOfDividers(X,PR,RESULT,1,0).
amountOfDividers(_,_,RESULT,INDEXPOW,1):- RESULT = INDEXPOW,!.
amountOfDividers(X,PR,RESULT,INDEXPOW,_):- pow1(PR,INDEXPOW,POW), (X mod POW =:= 0 -> NEWSTOP = 0, NEWINDEXPOW is INDEXPOW + 1; NEWSTOP = 1, NEWINDEXPOW is INDEXPOW-1), amountOfDividers(X,PR,RESULT,NEWINDEXPOW,NEWSTOP).

%appendXTimes(LIST,X,I,ANSWERLIST):- appendXTimes(LIST,X,I,ANSWERLIST).
appendXTimes(LIST,_,0,ANSWERLIST):- ANSWERLIST = LIST,!.
appendXTimes(LIST,X,I,ANSWERLIST):- append1(LIST,[X],NEWLIST), NEWI is I - 1 , appendXTimes(NEWLIST,X,NEWI,ANSWERLIST).

method352(X,ANSWERLIST):-method352(ANSWERLIST,[],X,X).
method352(ANSWERLIST,LIST,2,_):-append1(LIST,[1],NEWLIST), ANSWERLIST = NEWLIST,!.
method352(ANSWERLIST,LIST,PR,X):-NEWPR is PR - 1, prost(PR,BOOL), XX is X mod PR, (XX =:= 0, BOOL =:= 1 -> amountOfDividers(X,PR,I), appendXTimes(LIST,PR,I,NEWLIST); NEWLIST = LIST ), method352(ANSWERLIST, NEWLIST, NEWPR, X).



inList([H|_],H).
inList([_|T],X):-inList(T,X).

method14 :-
    LIST = [_,_,_],
    inList(LIST,[���������,_]),
    inList(LIST,[������,_]),
    inList(LIST,[�����,_]),
    inList(LIST,[_,�����]),
    inList(LIST,[_,�������]),
    inList(LIST,[_,������]),
    not(inList(LIST,[���������,�������])),
    not(inList(LIST,[������,������])),
    not(inList(LIST,[�����,�����])),
    write(LIST).

method15:-
    LIST=[_,_,_],
    inList(LIST,[���,X,X]),
    inList(LIST,[����,_,_]),
    inList(LIST,[�����,�������,_]),
    inList(LIST,[_,�����,_]),
    inList(LIST,[_,�����,_]),
    inList(LIST,[_,�������,_]),
    inList(LIST,[_,_,�����]),
    inList(LIST,[_,_,�����]),
    inList(LIST,[_,_,�������]),
    not(inList(LIST,[����,�����,_])),
    not(inList(LIST,[����,_,�����])),
    not(inList(LIST,[�����,Y,Y])),
    write(LIST).

method16:-
    LIST=[_,_,_],
    %inList(LIST,[���������,�������,������(������),�������,������]),
    inList(LIST,[�������,X1,0,0,_]),
    inList(LIST,[������,X2,_,1,_]),
    inList(LIST,[�������,X3,_,_,_]),
    inList(LIST,[_,�������,_,2,�������]),
    inList(LIST,[_,������,_,_,_]),
    inList(LIST,[_,�������,1,_,_]),
    write('�������-'),write(X1),nl,
    write('������-'),write(X2),nl,
    write('�������-'),write(X3),nl,
    write(LIST).

%method17:-
   % LIST=[_,_,_,_],
   % inList(LIST,[�������,_,_,_,_,_]),
   % inList(LIST,[������,_,_,_,_,_]),
   % inList(LIST,[������,_,_,_,_,_]),
   % inList(LIST,[�����,_,_,_,_,_]),
   % inList(LIST,[_,������,_,_,_,_]),
   % inList(LIST,[_,�������,_,_,_,_]),
   % inList(LIST,[_,����,_,_,_,_]),
   % inList(LIST,[_,����,_,_,_,_]),
   % inList(LIST,[������,_,_,������,�����,_]),
   % inList(LIST,[������,_,������,_,_,�����]),
   % inList(LIST,[_,�������,_,����,������,_]),
   % inList(LIST,[_,�������,����,_,_,������]),
   % not(inList(LIST,[�������,������,_,_,_,_])),
   % not(inList(LIST,[�������,����,_,_,_,_])),
   % not(inList(LIST,[�����,�������,_,_,_,_])),
   % not(inList(LIST,[�����,����,_,_,_,_])),
   % write(LIST).

right([_],_,_):-fail.
right([A|[B|_]],A,B).
right([_|LIST],A,B):-right(LIST,A,B).

left([_],_,_):-fail.
left([B|[A|_]],A,B).
left([_|LIST],A,B):-left(LIST,A,B).

mezhdy(LIST,A,B):-right(LIST,A,B).
mezhdy(LIST,A,B):-left(LIST,A,B).

method17:-
    LIST=[_,_,_,_],
    inList(LIST,[�������,_]),
    inList(LIST,[������,_]),
    inList(LIST,[������,_]),
    inList(LIST,[�����,_]),
    inList(LIST,[_,������]),
    inList(LIST,[_,�������]),
    inList(LIST,[_,����]),
    inList(LIST,[_,����]),
    right(LIST,[������,_],[_,�������]),
    right(LIST,[_,�������],[_,����]),
    mezhdy(LIST,[������,_],[�����,_]),
    mezhdy(LIST,[������,_],[_,������]),
    not(inList(LIST,[�������,������])),
    not(inList(LIST,[�������,����])),
    not(inList(LIST,[�����,�������])),
    not(inList(LIST,[�����,����])),
    write(LIST).


method18:-
    LIST=[_,_,_,_],
    inList(LIST,[�������,_]),
    inList(LIST,[������,_]),
    inList(LIST,[��������,_]),
    inList(LIST,[�������,_]),
    inList(LIST,[_,������]),
    inList(LIST,[_,��������]),
    inList(LIST,[_,��������]),
    inList(LIST,[_,�����]),
    not(inList(LIST,[�������,�����])),
    not(inList(LIST,[��������,�����])),
    not(inList(LIST,[������,��������])),
    not(inList(LIST,[������,��������])),
    not(inList(LIST,[�������,��������])),
    not(inList(LIST,[�������,��������])),
    write(LIST).

method19:-
    LIST=[_,_,_],
    %inList(LIST,[���,�����,��������������,�����]),
    inList(LIST,[�����,_,_,_]),
    inList(LIST,[������,_,_,_]),
    inList(LIST,[������,_,_,X2]),
    inList(LIST,[_,1,_,_]),
    inList(LIST,[_,2,_,_]),
    inList(LIST,[_,3,_,_]),
    inList(LIST,[_,_,����������,_]),
    inList(LIST,[_,_,������������,_]),
    inList(LIST,[X1,_,����������,_]),
    inList(LIST,[_,_,_,������]),
    inList(LIST,[_,_,_,���������]),
    inList(LIST,[_,_,_,������]),
    inList(LIST,[�����,_,_,���������]),
    inList(LIST,[_,1,_,������]),
    inList(LIST,[������,_,������������,_]),
    not(inList(LIST,[�����,_,����������,_])),
    not(inList(LIST,[������,_,_,������])),
    write('���������� -'),write(X1),nl,
    write('������ -'),write(X2).
