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

grand_ma_and_son(X,Y):- (man(Y),woman(X),grandma(X,Y));(man(X),woman(Y),grandma(Y,X)).%14

mulUp(X,Y):-X<10,Y is X,!.%15
mulUp(X,Y):-X1 is X div 10,mulUp(X1,Y1),Y is (X mod 10)*Y1,!.


