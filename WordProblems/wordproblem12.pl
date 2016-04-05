%Ruth had 5 nuts more than Dan had. Ruth gave Dan 3 nuts. Dan gave 2 nuts to David. Now Dan has 4 nuts and David has 6 nuts. How many nuts does Ruth have now?


type(give,changeOut).
type(moreThan, comparePlus).

holdsAt(P,V,NumOld,Obj,T):- initially(P,V,NumOld,Obj),(not(clipped(0,P,V,NumOld,Obj,T))).
holdsAt(P1,V,Ans,Obj,T2) :- happens(P1,Act,Num1,Obj,P2,T1), T2 is T1 - 1, holdsAt(P1,V, Num2, Obj, 
holdsAt(P2,V,Ans,Obj,T2) :- happens(P1,Act,Num1,Obj,P2,T1), T2 is T1 - 1, initiates(P1,Act,Num1,Obj,P2,P2,V,Num,Obj,T1),  type(Act,changeOut), Ans is Num-Num1. 
holdsAt(P1,V,Ans,Obj,T2) :- happens(P1,Act,Num1,Obj,P2,T1), T2 is T1 - 1, initiates(P1,Act,Num1,Obj,P2,P1,V,Num,Obj,T1),  type(Act,comparePlus), Ans is Num-Num1. 
holdsAt(P2,V,Ans,Obj,T2) :- happens(P1,Act,Num1,Obj,P2,T1), T2 is T1 - 1, initiates(P1,Act,Num1,Obj,P2,P2,V,Num,Obj,T1),  type(Act,comparePlus), Ans is Num+Num1. 
holdsAt(P,V,Num,Obj,T2) :- happens(c,c,c,c,c,T1), T2 is T1 - 1, initiates(c,c,c,c,c,P,V,Num,Obj,T1).
holdsAt(P,V,NumOld,Obj,T):- happens(P1,Act,Num,Obj,P2,T1), (T1 < T), initiates(P1,Act,Num,Obj,P2,P,V,NumOld,Obj,T1), (not(clipped(T1,P,V,NumOld,Obj,T))).
clipped(T1,P,V,NumOld,Obj,T2) :- happens(P1,Act,Num,Obj1,P2,T),(T1 =< T),(T < T2),terminates(P1,Act,Num,Obj1,P2,P,V,NumOld,Obj,T).


%initially(ruth,has,0,nut).
%initially(dan,has,0,nut).
%initially(david,has,0,nut).
%happens(ruth,moreThan,5,nut,dan,2).

terminates(Person1,Act,Num,Obj,Person2, Person1, V,NumOld,Obj, T) :- type(Act,X), holdsAt(Person1, V,NumOld,Obj, T).
terminates(Person1,Act,Num,Obj,Person2, Person2, V,NumOld,Obj, T) :- type(Act,X), holdsAt(Person2, V,NumOld,Obj, T).
terminates(c,c,c,c,c, Person1, V,0,Obj, T) :- holdsAt(Person1,V,0,Obj,T), holdsAt(Person1,V,Num1,Obj,T).
%terminates(c,c,c,c,c, Person1, V,0,Obj, T) :- T1 is T+1, holdsAt(Person1,V,0,Obj,T), holdsAt(Person1,V,Num1,Obj,T1).
initiates(c,c,c,c,c, Person1, V,Num1,Obj, T) :- holdsAt(Person1,V,Num1,Obj,T), Num1 =\= 0.
%initiates(c,c,c,c,c, Person1, V,Num1,Obj, T) :- T1 is T+1, holdsAt(Person1,V,0,Obj,T), holdsAt(Person1,V,Num1,Obj,T1).

initiates(Person1,Act,Num,Obj,Person2, Person1, V,NumAns,Obj, T) :- type(Act,changeOut), holdsAt(Person1, V,NumOld,Obj, T), NumAns is (NumOld - Num).
initiates(Person1,Act,Num,Obj,Person2, Person2, V,NumAns,Obj, T) :- type(Act,changeOut), holdsAt(Person2, V,NumOld,Obj, T), NumAns is NumOld + Num.
initiates(Person1,Act,Num,Obj,Person2, Person1, V,NumAns,Obj, T) :- type(Act,changeOut), holdsAt(Person1, V,NumOld,Obj, T), NumAns is NumOld - Num.
initiates(Person1,Act,Num,Obj,Person2, Person2, V,NumAns,Obj, T) :- type(Act,changeOut), holdsAt(Person2, V,NumOld,Obj, T), NumAns is NumOld + Num.
initiates(Person1,Act,Num,Obj,Person2, Person1, V,NumAns,Obj, T) :- type(Act,changeIn), holdsAt(Person1, V,NumOld,Obj, T), NumAns is NumOld + Num.
initiates(Person1,Act,Num,Obj,Person2, Person2, V,NumAns,Obj, T) :- type(Act,changeIn), holdsAt(Person2, V,NumOld,Obj, T), NumAns is NumOld - Num.
initiates(Person1,Act,Num,Obj,Person2, Person1, V,NumAns,Obj, T) :- type(Act,comparePlus), holdsAt(Person2, V,NumOld,Obj, T), NumAns is NumOld + Num.
initiates(Person1,Act,Num,Obj,Person2, Person2, V,NumAns,Obj, T) :- type(Act,comparePlus), holdsAt(Person1, V,NumOld,Obj, T), NumAns is NumOld - Num.
initiates(Person1,Act,Num,Obj,Person2, Person1, V,NumAns,Obj, T) :- type(Act,compareMinus), holdsAt(Person2, V,NumOld,Obj, T), NumAns is NumOld - Num.
initiates(Person1,Act,Num,Obj,Person2, Person2, V,NumAns,Obj, T) :- type(Act,compareMinus), holdsAt(Person1, V,NumOld,Obj, T), NumAns is NumOld + Num.
