monarch(elizabeth).
offspring(charles, elizabeth).
offspring(ann, elizabeth).
offspring(andrew, elizabeth).
offspring(edward, elizabeth).
male(charles).
male(andrew).
male(edward).
female(ann).
female(elizabeth).
elder(charles,ann).
elder(ann,andrew).
elder(andrew,edward).

succession_line(A,[A|B],B).
succession_line(A,[B|C],[B|D]) :-
          succession_line(A,C,D).

precedes(X,Y):-male(X),male(Y),elder(X,Y).
precedes(X,Y):-male(X),female(Y),not(Y=elizabeth).
precedes(X,Y):-female(X),female(Y),elder(X,Y).

succession_sort([A|B], Sorted) :- succession_sort(B, SortedTail), insert(A, SortedTail, Sorted).
succession_sort([], []).
insert(A, [B|C], [B|D]) :- not(precedes(A,B)), insert(A, C, D).
insert(A, C, [A|C]).
successor(X, Y):- child(Y,X).
successionList(X, SuccessionList):-
	findall(Y, successor(X, Y), SuccessionList).
successionListIndependent(X, SuccessionList):-
	findall(Y, child(Y,X), Children),
	succession_sort(Children, SuccessionList).
