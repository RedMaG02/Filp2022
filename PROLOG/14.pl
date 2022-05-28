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
