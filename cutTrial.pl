likes(aby, X) :- orange(X), ! , fail.
likes(aby, X) :- fruit(X).
fruit(X) :- orange(X).
fruit(X) :- apple(X).
fruit(X) :- mango(X).
mango(m).
apple(a).
orange(o).

