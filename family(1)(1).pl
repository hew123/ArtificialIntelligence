brother(peter, warren).
brother(jerry,kather).
brother(jerry,stuart).
male(stuart).
male(peter).
male(warren).
male(jerry).
female(kather).
female(ann).
female(maryalice).
sister(kather,jerry).
sister(ann, maryalice).
parent_of(maryalice,jerry).
parent_of(warren,jerry).
father(X,Y):-parent_of(X,Y),male(X).
mother(X,Y):-parent_of(X,Y),female(X).
parent_of(X,Y):-brother(Z,Y),(father(X,Z);mother(X,Z)).
