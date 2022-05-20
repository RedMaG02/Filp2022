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

%mulDown(X,Y):- X<10, ANSWER is (X * Y), print(ANSWER),!.
% mulDown(X,Y):- X1 is (x div 10)< Y1 is (Y * (X mod 10)),
% mulDown(X1,Y1).

mulDown(X,Y):- mulDown(X,Y,1).
mulDown(X,Y,Z):- X<10, Y is (X*Z),!.
mulDown(X,Y,Z):- X>9, X1 is (X div 10),Z1 is (Z * (X mod 10)), mulDown(X1,Y,Z1).

