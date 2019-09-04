male(jerry).
male(stuart).
male(warren).
male(peter).
female(kather).
female(maryalice).
female(ann).
brother(jerry,stuart).
brother(jerry,kather).
brother(peter, warren).
sister(ann, maryalice).
sister(kather,jerry).
parent_of(warren,jerry).
parent_of(maryalice,jerry).
parent_of(X,Y):-brother(Z,Y),(father(X,Z);mother(X,Z)).
father(X,Y):-parent_of(X,Y),male(X).
mother(X,Y):-parent_of(X,Y),female(X).
