man(voeneg).
man(ratibor).
man(boguslav).
man(velerad).
man(duhovlad).
man(svyatoslav).
man(dobrozhir).
man(bogomil).
man(zlatomir).

woman(goluba).
woman(lubomila).
woman(bratislava).
woman(veslava).
woman(zhdana).
woman(bozhedara).
woman(broneslava).
woman(veselina).
woman(zdislava).

parent(voeneg,ratibor).
parent(voeneg,bratislava).
parent(voeneg,velerad).
parent(voeneg,zhdana).

parent(goluba,ratibor).
parent(goluba,bratislava).
parent(goluba,velerad).
parent(goluba,zhdana).

parent(ratibor,svyatoslav).
parent(ratibor,dobrozhir).
parent(lubomila,svyatoslav).
parent(lubomila,dobrozhir).

parent(boguslav,bogomil).
parent(boguslav,bozhedara).
parent(bratislava,bogomil).
parent(bratislava,bozhedara).

parent(velerad,broneslava).
parent(velerad,veselina).
parent(veslava,broneslava).
parent(veslava,veselina).

parent(duhovlad,zdislava).
parent(duhovlad,zlatomir).
parent(zhdana,zdislava).
parent(zhdana,zlatomir).

father(X,Y):-man(X),parent(X,Y). %z11
father(X):-father(Y,X),print(Y),nl,fail.

waifu(X,Y):- parent(X,Z),parent(Y,Z),woman(X).%12
waifu(X):- waifu(Y,X),print(Y),nl,fail.

grand_ma(X,Y):- parent(X,Z),parent(Z,Y),woman(X).%13
grand_mas(X):- grand_ma(Y,X),print(Y),nl,fail.

grand_ma_and_son(X,Y):- (man(Y),woman(X),grand_ma(X,Y));(man(X),woman(Y),grand_ma(Y,X)).%14

mulUp(X,Y):-X<10,Y is X,!.%15
mulUp(X,Y):-X1 is X div 10,mulUp(X1,Y1),Y is (X mod 10)*Y1,!.

%mulDown(X,Y):- X<10, ANSWER is (X * Y), print(ANSWER),!. %16
% mulDown(X,Y):- X1 is (x div 10)< Y1 is (Y * (X mod 10)),
% mulDown(X1,Y1).

mulDown(X,Y):- mulDown(X,Y,1). %16
mulDown(X,Y,Z):- X<10, Y is (X*Z),!.
mulDown(X,Y,Z):- X>9, X1 is (X div 10),Z1 is (Z * (X mod 10)), mulDown(X1,Y,Z1).

findFirst3(X,ANSWER):- findFirst3(X, ANSWER, 0).
findFirst3(0,ANS,CUR):-(CUR mod 3  \= 0 ->  ANS is CUR; ANS is -1),!.
findFirst3(X,ANSWER,CUR):- CURN is X mod 10, NEWX is X div 10, (CURN \= 0 -> findFirst3(NEWX,ANSWER,CURN); findFirst3(NEWX,ANSWER,CUR)).

maxDel3(X,ANSWER):- X<10, DEL is (X mod 3),(DEL\=0 -> ANSWER is X; ANSWER is -1),!. %17
maxDel3(X,ANSWER):- X>9, NEWX is X div 10, CURMAX is (X mod 10),CURMAXOST is (X mod 10) mod 3, maxDel3(NEWX,ANSWER1),  (CURMAXOST\=0  ->( CURMAX > ANSWER1 -> ANSWER is CURMAX; ANSWER is ANSWER1);ANSWER is ANSWER1).

maxDel3Down(X,ANSWER):- findFirst3(X,ANSWER1), maxDel3Down(X,ANSWER,ANSWER1).%18
maxDel3Down(0,ANS,ANSWER1):-ANS is ANSWER1,!.
maxDel3Down(X,ANSWER,CURMAX):- NEWX is X div 10, CURX is X mod 10, CURX3 is CURX mod 3, (CURX3 \= 0 -> (CURX > CURMAX -> NEWCURMAX is CURX; NEWCURMAX is CURMAX); NEWCURMAX is CURMAX), maxDel3Down(NEWX,ANSWER,NEWCURMAX).

fib(1,1):-!.
fib(2,1):-!.
fib(N,X):- FirstFibN is N-1, SecondFibN is N-2, fib(FirstFibN, FirstFibX),fib(SecondFibN, SecondFibX), X is (FirstFibX + SecondFibX).
