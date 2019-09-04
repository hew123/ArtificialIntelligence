male(charles).
male(edward).
male(andrew).

female(elizabeth).
female(ann).

offspring(charles, elizabeth).
offspring(ann, elizabeth).
offspring(andrew, elizabeth).
offspring(edward, elizabeth).

elder(charles, ann).
elder(charles, andrew).
elder(charles, edward).
elder(ann, andrew).
elder(ann, edward).
elder(andrew, edward).

successor(X, Y):- offspring(Y,X).

successionList(X, SuccessionList):-
	findall(Y, successor(X, Y), SuccessionList).

precedes(X,Y):- male(X), male(Y), elder(X,Y).
precedes(X,Y):- male(X), female(Y), Y\=elizabeth.
precedes(X,Y):- female(X), female(Y), elder(X,Y).

succession_sort([A|B], Sorted) :- succession_sort(B, SortedTail), insert(A, SortedTail, Sorted).
succession_sort([], []).

insert(A, [B|C], [B|D]) :- not(precedes(A,B)), !, insert(A, C, D).
insert(A, C, [A|C]).

successionListIndependent(X, SuccessionList):-
	findall(Y, elder(Y,X), Children),
	succession_sort(Children, SuccessionList).
