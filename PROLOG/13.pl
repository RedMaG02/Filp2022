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
    inList(LIST,[белокуров,_]),
    inList(LIST,[чернов,_]),
    inList(LIST,[рыжов,_]),
    inList(LIST,[_,рыжий]),
    inList(LIST,[_,блондин]),
    inList(LIST,[_,брюнет]),
    not(inList(LIST,[белокуров,блондин])),
    not(inList(LIST,[чернов,брюнет])),
    not(inList(LIST,[рыжов,рыжий])),
    write(LIST).

method15:-
    LIST=[_,_,_],
    inList(LIST,[ан€,X,X]),
    inList(LIST,[вал€,_,_]),
    inList(LIST,[наст€,зеленые,_]),
    inList(LIST,[_,белые,_]),
    inList(LIST,[_,синие,_]),
    inList(LIST,[_,зеленые,_]),
    inList(LIST,[_,_,белые]),
    inList(LIST,[_,_,синие]),
    inList(LIST,[_,_,зеленые]),
    not(inList(LIST,[вал€,белые,_])),
    not(inList(LIST,[вал€,_,белые])),
    not(inList(LIST,[наст€,Y,Y])),
    write(LIST).

method16:-
    LIST=[_,_,_],
    %inList(LIST,[ƒќЋ∆Ќќ—“№,‘јћ»Ћ»я,—≈—“–џ(Ѕ–ј“№я),¬ќ«–ј—“,—”ѕ–”√]),
    inList(LIST,[слесарь,X1,0,0,_]),
    inList(LIST,[токарь,X2,_,1,_]),
    inList(LIST,[сварщик,X3,_,_,_]),
    inList(LIST,[_,семенов,_,2,борисов]),
    inList(LIST,[_,иванов,_,_,_]),
    inList(LIST,[_,борисов,1,_,_]),
    write('слесарь-'),write(X1),nl,
    write('токарь-'),write(X2),nl,
    write('сварщик-'),write(X3),nl,
    write(LIST).

%method17:-
   % LIST=[_,_,_,_],
   % inList(LIST,[бутылка,_,_,_,_,_]),
   % inList(LIST,[стакан,_,_,_,_,_]),
   % inList(LIST,[кувшин,_,_,_,_,_]),
   % inList(LIST,[банка,_,_,_,_,_]),
   % inList(LIST,[_,молоко,_,_,_,_]),
   % inList(LIST,[_,лимонад,_,_,_,_]),
   % inList(LIST,[_,квас,_,_,_,_]),
   % inList(LIST,[_,вода,_,_,_,_]),
   % inList(LIST,[стакан,_,_,молоко,банка,_]),
   % inList(LIST,[стакан,_,молоко,_,_,банка]),
   % inList(LIST,[_,лимонад,_,квас,кувшин,_]),
   % inList(LIST,[_,лимонад,квас,_,_,кувшин]),
   % not(inList(LIST,[бутылка,молоко,_,_,_,_])),
   % not(inList(LIST,[бутылка,вода,_,_,_,_])),
   % not(inList(LIST,[банка,лимонад,_,_,_,_])),
   % not(inList(LIST,[банка,вода,_,_,_,_])),
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
    inList(LIST,[бутылка,_]),
    inList(LIST,[стакан,_]),
    inList(LIST,[кувшин,_]),
    inList(LIST,[банка,_]),
    inList(LIST,[_,молоко]),
    inList(LIST,[_,лимонад]),
    inList(LIST,[_,квас]),
    inList(LIST,[_,вода]),
    right(LIST,[кувшин,_],[_,лимонад]),
    right(LIST,[_,лимонад],[_,квас]),
    mezhdy(LIST,[стакан,_],[банка,_]),
    mezhdy(LIST,[стакан,_],[_,молоко]),
    not(inList(LIST,[бутылка,молоко])),
    not(inList(LIST,[бутылка,вода])),
    not(inList(LIST,[банка,лимонад])),
    not(inList(LIST,[банка,вода])),
    write(LIST).


method18:-
    LIST=[_,_,_,_],
    inList(LIST,[воронов,_]),
    inList(LIST,[павлов,_]),
    inList(LIST,[левицкий,_]),
    inList(LIST,[сахаров,_]),
    inList(LIST,[_,танцор]),
    inList(LIST,[_,художник]),
    inList(LIST,[_,писатель]),
    inList(LIST,[_,певец]),
    not(inList(LIST,[воронов,певец])),
    not(inList(LIST,[левицкий,певец])),
    not(inList(LIST,[павлов,писатель])),
    not(inList(LIST,[павлов,художник])),
    not(inList(LIST,[воронов,писатель])),
    not(inList(LIST,[сахаров,писатель])),
    write(LIST).

method19:-
    LIST=[_,_,_],
    %inList(LIST,[»ћя,ћ≈—“ќ,Ќј÷»ќЌјЋ№Ќќ—“№,—ѕќ–“]),
    inList(LIST,[майкл,_,_,_]),
    inList(LIST,[саймон,_,_,_]),
    inList(LIST,[ричард,_,_,X2]),
    inList(LIST,[_,1,_,_]),
    inList(LIST,[_,2,_,_]),
    inList(LIST,[_,3,_,_]),
    inList(LIST,[_,_,американец,_]),
    inList(LIST,[_,_,израильт€нин,_]),
    inList(LIST,[X1,_,австралиец,_]),
    inList(LIST,[_,_,_,крикет]),
    inList(LIST,[_,_,_,баскетбол]),
    inList(LIST,[_,_,_,теннис]),
    inList(LIST,[майкл,_,_,баскетбол]),
    inList(LIST,[_,1,_,крикет]),
    inList(LIST,[саймон,_,израильт€нин,_]),
    not(inList(LIST,[майкл,_,американец,_])),
    not(inList(LIST,[саймон,_,_,теннис])),
    write('јвстралиец -'),write(X1),nl,
    write('–ичард -'),write(X2).
