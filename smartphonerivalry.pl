competitor(sumsum, appy).
technology(galacticaS3,sumsum).
boss(stevey, appy).
stole(stevey, galacticaS3).
unethical(X) :- boss(X,Y), competitor(Z,Y), stole(X,S), technology(S,Z).
