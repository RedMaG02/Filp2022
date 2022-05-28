readString(S,N):-get0(X),readString(S,N,0,[],X).
readString(S,N,N,S,10):-!.
readString(S,N,K,CURS,X):-NEWK is K + 1,append(CURS,[X],NEWCURS),get0(NEWX),readString(S,N,NEWK,NEWCURS,NEWX).

writeString([]):-!.
writeString([H|T]):-put(H),writeString(T).

writeListOfString([]):-!.
writeListOfString([H|T]):-writeString(H),nl,writeListOfString(T).


reverseString(LIST,ANSWERLIST):- reverseString(LIST,ANSWERLIST,[]).
reverseString([],CURLIST,CURLIST):-!.
reverseString([H|T],ANSWERLIST,CURLIST):- reverseString(T,ANSWERLIST,[H|CURLIST]).

method34(LIST):-reverseString(LIST,REVLIST), method34(LIST,REVLIST,1).
method34([],[],B):- B is 1,!.
method34([H|T],[H|T2],B):- method34(T,T2,B).
method34([_|T],[_|T2],_):- method34(T,T2,0).
