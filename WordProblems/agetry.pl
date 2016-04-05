age(father,2016,42).
age(son,2016,14).
plus(0,X,X).

birthYear(P,X) :- age(P,Y,Z), equation(X,Z,Y).
age(P,Y,A) :- birthYear(P,X), equation(A,X,Y).

equation(X,Y,Z):- var(X),X is Z-Y.
equation(X,Y,Z):- var(Y),Y is Z-X.
equation(X,Y,Z):- var(Z),Z is X+Y.
