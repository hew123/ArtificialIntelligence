male(ten).
male(chan).
male(wei).
male(yao).
male(meng).
male(zhang).
male(feng).
female(ling).
female(yong).
female(pei).
female(ting).
female(min).
female(yi).
brother(chan,meng).
brother(chan,yong).
brother(yao,wei).
sister(min, yi).
parent(ten,meng).
parent(ten,yong).
parent(ten,chan).
parent(meng,feng).
parent(pei,feng).
parent(yong,ling).
parent(zhang,ling).
parent(chan,yao).
parent(chan,min).
parent(chan,wei).
parent(chan,yi).
parent(ting,yao).
parent(ting,min).
parent(ting,wei).
parent(ting,yi).
father(X,Y):-parent(X,Y),male(X).
mother(X,Y):-parent(X,Y),female(X).
son(X,Y):-parent(Y,X),male(X).
daughter(X,Y):-parent(Y,X),female(Y).
grandfather(X,Y):-male(X),father(X,Z),parent(Z,Y).
sibling(X,Y):-parent(Z,X),parent(Z,Y),not(X=Y).
aunt(X,Y):-female(X),father(Z,Y),sibling(Z,X).
uncle(X,Y):-male(X),father(Z,Y),sibling(Z,X).
cousin(X,Y):-(aunt(Z,Y);uncle(Z,Y)),parent(Z,X).
spouse(X,Y):-parent(X,Z),parent(Y,Z),not(X=Y).







