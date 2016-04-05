possibly(p1(a)).
knows(p2(X)) :- knows(p1(X)).
knows(knows(p3(X)) :- knows(p1(X)), knows(p2(X)).
knows(p4(X)) :- p3(X).
knows(p5(X)) :- p4(X).

possibly(X) :- knows(X).
X :- knows(X).
knows(X) :- X.
knows(possibly(X)) :- X.
