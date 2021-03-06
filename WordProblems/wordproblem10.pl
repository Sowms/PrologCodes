happens(david,give,3,candy,ruth,1).
happens(john,give,2,candy,david,2).
happens(david,moreThan,4,candy,ruth,3).
initially(ruth,has,7,candy).

altogether(P1,P2,V,Z,Obj,T) :- holdsAt(P1,V,X,Obj,T),holdsAt(P2,V,Y,Obj,T), Z is X + Y.
 
type(give,changeOut).
type(put,changeOut).
type(place, changeOut).
type(sell, changeOut).
type(give, changeOut).
type(moreThan, comparePlus).
type(lessThan, compareMinus).
type(get, changeIn).
type(buy, changeIn).
type(take, changeIn).
type(borrow, changeIn).
type(lose, changeOut).
type(remove, changeOut).
type(spend, changeOut).
type(eat, changeOut).
type(more, changeIn).

clipped(T1,P,V,NumOld,Obj,T2) :- happens(P1,Act,Num,Obj,P2,T),(T1 < T),(T < T2),terminates(P1,Act,Num,Obj,P2,P,V,NumOld,Obj,T).
holdsAt(P,V,NumOld,Obj,T):- initially(P,V,NumOld,Obj),(not(clipped(0,P,V,NumOld,Obj,T))).
holdsAt(P,V,NumOld,Obj,T):- happens(P1,Act,Num,Obj,P2,T1), (T1 < T), initiates(P1,Act,Num,Obj,P2,P,V,NumOld,Obj,T1), (not(clipped(T1,P,V,NumOld,Obj,T))).

terminates(Person1,Act,Num,Obj,Person2, Person1, V,NumOld,Obj, T) :- type(Act,X), holdsAt(Person1,V,NumOld,Obj,T).
terminates(Person1,Act,Num,Obj,Person2, Person2, V,NumOld,Obj, T) :- type(Act,X), holdsAt(Person2,V,NumOld,Obj,T).
initiates(Person1,Act,Num,Obj,Person2, Person1, V,NumAns,Obj, T) :- type(Act,changeOut), holdsAt(Person1, V,NumOld,Obj, T), NumAns is NumOld - Num.
initiates(Person1,Act,Num,Obj,Person2, Person2, V,NumAns,Obj, T) :- type(Act,changeOut), holdsAt(Person2, V,NumOld,Obj, T), NumAns is NumOld + Num.
initiates(Person1,Act,Num,Obj,Person2, Person1, V,NumAns,Obj, T) :- type(Act,changeIn), holdsAt(Person1, V,NumOld,Obj, T), NumAns is NumOld + Num.
initiates(Person1,Act,Num,Obj,Person2, Person2, V,NumAns,Obj, T) :- type(Act,changeIn), holdsAt(Person2, V,NumOld,Obj, T), NumAns is NumOld - Num.
initiates(Person1,Act,Num,Obj,Person2, Person1, V,NumAns,Obj, T) :- type(Act,comparePlus), holdsAt(Person2, V,NumOld,Obj, T), NumAns is NumOld + Num.
initiates(Person1,Act,Num,Obj,Person2, Person1, V,NumAns,Obj, T) :- type(Act,compareMinus), holdsAt(Person2, V,NumOld,Obj, T), NumAns is NumOld - Num.
