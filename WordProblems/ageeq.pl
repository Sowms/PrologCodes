holdsAt(age(boy,x),0).
holdsAt(age(brother,y),0).
holdsAt(age(boy,x+4),4).
holdsAt(age(brother,y+4),4).
olderThan(boy,brother,10).

equation(X,Y+Z) :- olderThan(P1,P2,Z), holdsAt(age(P1,X),T), holdsAt(age(P2,Y),T).
equation(X,2*Y) :- twice(X,Y).
twice(X,Y) :- holdsAt(age(boy,X),4), holdsAt(age(brother,Y),4).

