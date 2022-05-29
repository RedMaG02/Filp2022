readString(S,N):-get0(X),readString(S,N,0,[],X).
readString(S,N,N,S,10):-!.
readString(S,N,K,CURS,X):-NEWK is K + 1,append(CURS,[X],NEWCURS),get0(NEWX),readString(S,N,NEWK,NEWCURS,NEWX).

writeString([]):-!.
writeString([H|T]):-put(H),writeString(T).

writeListOfString([]):-!.
writeListOfString([H|T]):-writeString(H),nl,writeListOfString(T).

writeList([]):-!.
writeList([H|T]):-write(H),writeList(T).


reverseString(LIST,ANSWERLIST):- reverseString(LIST,ANSWERLIST,[]).
reverseString([],CURLIST,CURLIST):-!.
reverseString([H|T],ANSWERLIST,CURLIST):- reverseString(T,ANSWERLIST,[H|CURLIST]).

method34(LIST):-reverseString(LIST,REVLIST), method34(LIST,REVLIST,1).
method34([],[],B):- B is 1,!.
method34([H|T],[H|T2],B):- method34(T,T2,B).
method34([_|T],[_|T2],_):- method34(T,T2,0).


method411(LIST,ANSWER):- method411(LIST,ANSWER,1).
method411([],K,K):-!.
method411([H|T],ANSWER,K):- (H=:=32 -> NEWK is K+1;NEWK = K), method411(T,ANSWER,NEWK).

method411Test:- readString(STR,N), method411(STR,K), write(K).




inListDelete([X|T],X,T).
inListDelete([H|T],X,[H|T1]):- inListDelete(T,X,T1).

listRavni(LIST1,LIST2):- listRavni(LIST1,LIST2,1).
listRavni([],[],B):- B is 1,!.
listRavni([H|T],[H|T2],B):- listRavni(T,T2,B).
listRavni([_|T],[_|T2],_):- listRavni(T,T2,0).



deleteAllXElements(LIST,X,ANSWERLIST):- deleteAllXElements(LIST,X,ANSWERLIST,[]).
deleteAllXElements([],_,LIST,LIST):-!.
deleteAllXElements([H|T],X,ANSWERLIST,CURLIST):- (H=:=X -> NEWCURLIST = CURLIST; append(CURLIST,[H],NEWCURLIST) ), deleteAllXElements(T,X,ANSWERLIST,NEWCURLIST).

method515(LIST,ANSWER):- method515(LIST,ANSWER,0).
method515([],K,K):-!.
method515([H|T],ANSWER,K):- NEWK is K + 1, deleteAllXElements([H|T],H,NEWLIST), method515(NEWLIST,ANSWER,NEWK).


inList([X|_],X).
inList([_|T],X):- inList(T,X).

razmeshP(LIST,K):- razmeshP(LIST,K,[],ANSWER), write(ANSWER), nl, fail.
razmeshP(_,0,RESULT,RESULT):-!.
razmeshP(LIST,K,RESULT,ANSWER):- inList(LIST,X), NEWK is K - 1, razmeshP(LIST,NEWK,[X|RESULT],ANSWER).
m1:- tell('j:/FILP/Filp2022/PROLOG/razmeshP.txt'), not(razmeshP([1,2,3,4],3)),told.

perest(LIST):- perest(LIST,[],ANSWER), write(ANSWER), nl, fail.
perest([],RESULT,RESULT):-!.
perest(LIST,RESULT,ANSWER):- inListDelete(LIST,X,NEWLIST), perest(NEWLIST,[X|RESULT],ANSWER).
m2:- tell('j:/FILP/Filp2022/PROLOG/perest.txt'), not(perest([1,2,3,4])),told.

razmesh(LIST,K):- razmesh(LIST,K,[],ANSWER), write(ANSWER),nl, fail.
razmesh(_,0,RESULT,RESULT):-!.
razmesh(LIST,K,RESULT,ANSWER):- NEWK is K - 1, inListDelete(LIST,X,NEWLIST), razmesh(NEWLIST,NEWK,[X|RESULT],ANSWER).
m3:- tell('j:/FILP/Filp2022/PROLOG/razmesh.txt'), not(razmesh([1,2,3,4],3)),told.

sochets(LIST):- sochets(LIST,ANSWER), write(ANSWER),nl,fail.
sochets([],[]):-!.
sochets([H|TAIL],[H|TAIL2]):- sochets(TAIL,TAIL2).
sochets([_|TAIL],ANSWER):- sochets(TAIL,ANSWER).
m4:- tell('j:/FILP/Filp2022/PROLOG/subsets.txt'), not(sochets([1,2,3,4])),told.

sochet(LIST,K):- sochet(LIST,K,ANSWER), write(ANSWER),nl,fail.
sochet(_,0,[]):-!.
sochet([H|TAIL], K, [H|TAIL2]):- NEWK is K-1, sochet(TAIL,NEWK,TAIL2).
sochet([_|TAIL],K,ANSWER):- sochet(TAIL,K,ANSWER).
m5:- tell('j:/FILP/Filp2022/PROLOG/sochet.txt'), not(sochet([1,2,3,4],3)),told.

sochetP(LIST,K):- sochetP(LIST,K,ANSWER), write(ANSWER),nl,fail.
sochetP(_,0,[]):-!.
sochetP([H|TAIL], K, [H|TAIL2]):- NEWK is K - 1, sochetP([H|TAIL],NEWK,TAIL2).
sochetP([_|TAIL],K,ANSWER):- sochetP(TAIL,K,ANSWER).
m6:- tell('j:/FILP/Filp2022/PROLOG/sochetP.txt'), not(sochetP([1,2,3,4],3)),told.

toIndex(L,I,El):-toIndex(L,I,El,0).
toIndex([H|_],K,H,K):-!.
toIndex([_|Tail],I,El,Cou):- Cou1 is Cou + 1, toIndex(Tail,I,El,Cou1).

m7:-
    WORD=[_,_,_,_,_],
    sochet([0,1,2,3,4],2,[IA1,IA2]),

    toIndex(WORD,IA1,a),
    toIndex(WORD,IA2,a),

    inListDelete([0,1,2,3,4],IA1,T2),
    inListDelete(T2,IA2,[I1,I2,I3]),

    razmeshP([b,c,d,e,f],3,[],[X1,X2,X3]),

    toIndex(WORD, I1, X1),
    toIndex(WORD, I2, X2),
    toIndex(WORD, I3, X3),

    writeList(WORD), nl, fail.

m7toFile:-
    tell('j:/FILP/Filp2022/PROLOG/m7.txt'),
    not(m7),
    told.

m8:-
    WORD=[_,_,_,_,_],
    sochet([0,1,2,3,4],2,[IA1,IA2]),

    toIndex(WORD,IA1,a),
    toIndex(WORD,IA2,a),

    inListDelete([0,1,2,3,4],IA1,T2),
    inListDelete(T2,IA2,[I1,I2,I3]),

    razmesh([b,c,d,e,f],3,[],[X1,X2,X3]),

    toIndex(WORD, I1, X1),
    toIndex(WORD, I2, X2),
    toIndex(WORD, I3, X3),

    writeList(WORD), nl, fail.

m8toFile:-
    tell('j:/FILP/Filp2022/PROLOG/m8.txt'),
    not(m8),
    told.

m9:-
    WORD=[_,_,_,_,_],
    sochet([a,b,c,d,e,f],1,[A]),
    inListDelete([a,b,c,d,e,f],A,T1),

    sochet([0,1,2,3,4],2,[IA1,IA2]),

    toIndex(WORD,IA1,A),
    toIndex(WORD,IA2,A),

    inListDelete([0,1,2,3,4],IA1,T2),
    inListDelete(T2,IA2,[I1,I2,I3]),

    razmesh(T1,3,[],[X1,X2,X3]),

    toIndex(WORD, I1, X1),
    toIndex(WORD, I2, X2),
    toIndex(WORD, I3, X3),

    writeList(WORD), nl, fail.

m9toFile:-
    tell('j:/FILP/Filp2022/PROLOG/m9.txt'),
    not(m9),
    told.

m10:-
    WORD=[_,_,_,_,_,_],
    sochet([a,b,c,d,e,f],2,[A,B]),
    inListDelete([a,b,c,d,e,f],A,T1),
    inListDelete(T1,B,T11),

    sochet([0,1,2,3,4,5],2,[IA1,IA2]),

    toIndex(WORD,IA1,A),
    toIndex(WORD,IA2,A),

    inListDelete([0,1,2,3,4,5],IA1,T2),
    inListDelete(T2,IA2,T22),

    sochet(T22,2,[IB1,IB2]),

    toIndex(WORD,IB1,B),
    toIndex(WORD,IB2,B),

    inListDelete(T22,IB1,T222),
    inListDelete(T222,IB2,[I1,I2]),

    razmesh(T11,2,[],[X1,X2]),

    toIndex(WORD, I1, X1),
    toIndex(WORD, I2, X2),

    writeList(WORD), nl, fail.

m10toFile:-
    tell('j:/FILP/Filp2022/PROLOG/m10.txt'),
    not(m10),
    told.



method11:-
    readString(STR,N),
    writeString(STR), write(', '), writeString(STR), write(', '), writeString(STR), write(', '), write(N).

