terminates(putdown(X),holding(X),T):- holdsAt(holding(X),T).
terminates(pickup(X),armempty,T) :- holdsAt(onTable(X),T),holdsAt(armempty,T),holdsAt(clear(X),T).
terminates(pickup(X),onTable(X),T) :- holdsAt(onTable(X),T),holdsAt(armempty,T),holdsAt(clear(X),T).
terminates(stack(X,Y),holding(X),T) :- holdsAt(holding(X),T),holdsAt(clear(Y),T).
terminates(stack(X,Y),clear(Y),T) :- holdsAt(holding(X),T),holdsAt(clear(Y),T).
terminates(unstack(X,Y),on(X,Y),T) :- holdsAt(on(X,Y),T),holdsAt(clear(X),T),holdsAt(armempty,T).
terminates(unstack(X,Y),armempty,T) :- holdsAt(on(X,Y),T),holdsAt(clear(X),T),holdsAt(armempty,T).

initiates(pickup(X),holding(X),T) :- holdsAt(onTable(X),T),holdsAt(armempty,T),holdsAt(clear(X),T).
initiates(putdown(X),armempty,T):- holdsAt(holding(X),T).
initiates(putdown(X),onTable(X),T):- holdsAt(holding(X),T).
initiates(stack(X,Y),armempty,T):- holdsAt(holding(X),T),holdsAt(clear(Y),T).
initiates(stack(X,Y),on(X,Y),T):- holdsAt(holding(X),T),holdsAt(clear(Y),T).
initiates(unstack(X,Y),holding(X),T):- holdsAt(on(X,Y),T),holdsAt(clear(X),T),holdsAt(armempty,T).
initiates(unstack(X,Y),clear(Y),T):- holdsAt(on(X,Y),T),holdsAt(clear(X),T),holdsAt(armempty,T).

clipped(T1,F,T2) :- happens(A,T),(T1<T),(T<T2),terminates(A,F,T).

holdsAt(F,T):- initially(F),(\+clipped(0,F,T)).
holdsAt(F,T):- happens(A,T1),initiates(A,F,T1),(T1<T),(\+clipped(T1,F,T)).

initially(onTable(a)).
initially(onTable(b)).
initially(clear(a)).
initially(clear(b)).
initially(armempty).
happens(pickup(a),2).
happens(stack(a,b),3).
