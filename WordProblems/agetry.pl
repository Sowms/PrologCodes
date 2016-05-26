use_module(library(clpfd)).
age(father,2016,42).
age(son,2016,14).

birthYear(P,X) :- age(P,Y,Z), !, X+Z #= Y.
age(P,Y,A) :- birthYear(P,X), !, A+X #= Y.

