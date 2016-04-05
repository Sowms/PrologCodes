initially(john,has,3,apple).
happens(john,give,1,apple,mary,1).

type(give, changeOut).

clipped(T1,P,V,NumOld,Obj,T2) :- happens(P1,Act,Num,Obj,P2,T),(T1<T),(T<T2),terminates(P1,Act,Num,Obj,P2,P,V,NumOld,Obj,T).
holdsAt(P,V,NumOld,Obj,T):- initially(P,V,NumOld,Obj),(\+clipped(0,P,V,NumOld,Obj,T)).
holdsAt(P,V,NumOld,Obj,T):- happens(P1,Act,Num,Obj,P2,T1),initiates(P1,Act,Num,Obj,P2,P,V,NumOld,Obj,T1),(T1<T),(\+clipped(T1,P,V,NumOld,Obj,T)).

terminates(Person1,Act,Num,Obj,Person2, Person1, V,NumOld,Obj, T) :- type(Act,X), holdsAt(Person1,V,NumOld,Obj,T).

initiates(Person1,Act,Num,Obj,Person2, Person1, V,NumAns,Obj, T) :- type(Act,changeOut), holdsAt(Person1, V,NumOld,Obj, T), NumAns is NumOld - Num.

