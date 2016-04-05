knows(likes_football(husband(X))) :- knows(woman(X)), knows(likes_football(X)).
possibly(likes_football(X)) :- man(X).
man(husband(X)) :- woman(X).
man(tom).
woman(jane).
woman(mary).
likes_football(jane).
possibly(X) :- knows(X).
knows(X) :- X.
