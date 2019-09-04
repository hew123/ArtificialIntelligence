parent(ten,chan).
haha(hew).
ask():-write("question"),nl,read(X),ans(X), ask.
ans(X):-list2(A),member(X,A),write("yes"),nl ; write("no"),nl.
%ans(X):-list2(A),not(member(X,A)),write("no").nl.

%read(X):-parent(ten,chan);haha(hew);haha(he).

list([hasball,hasshit,haspee]).

list2([1,2,3]).

