male(charles).
male(edward).
male(andrew).

female(elizabeth).
female(ann).

child(charles, elizabeth).
child(ann, elizabeth).
child(andrew, elizabeth).
child(edward, elizabeth).

elder(charles, ann).
elder(charles, andrew).
elder(charles, edward).
elder(ann, andrew).
elder(ann, edward).
elder(andrew, edward).

precedes(X,Y):- male(X), male(Y), elder(X,Y).
precedes(X,Y):- male(X), female(Y), Y\=elizabeth.
precedes(X,Y):- female(X), female(Y), elder(X,Y).

succession_sort([A|B], X) :- succession_sort(B, SortedTail), insert(A, SortedTail, X).
succession_sort([], []).

insert(A, [B|C], [B|D]) :- not(precedes(A,B)), !, insert(A, C, D).
insert(A, C, [A|C]).
