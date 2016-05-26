age(father,2016,42).
age(son,2016,14).
age(P,Y1,A1) :- age(P,Y2,A2), !, A2 - A1 #= Y2 - Y1.


