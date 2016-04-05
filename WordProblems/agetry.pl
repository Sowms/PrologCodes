use_module(library(clpfd)).
age(father,2016,42).
age(son,2016,14).
plus(0,X,X).

birthYear(P,X) :- age(P,Y,Z), X+Z #= Y.
age(P,Y,A) :- birthYear(P,X), A+X #= Y.

