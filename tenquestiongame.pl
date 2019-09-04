/*ask will jumpstart the program*/
/*then 5 categories of games will be displayed for the guesser to choose*/
ask:-	write("Hey... Choose a game"),nl,
        write(" 1. sports 2. animals, 3.food, 4,drinks, 5.carbrand. "),nl, read(Category), validate(Category).


/*upon choosing a category, validate takes in the category and output an answer from related(X,Y) predicate.*/
/*essentially, related(X,Y) generates random answer for the guesser to guess, in the category knowledge base*/
/*then question(X) will be prompted to display questions*/
/*then the guesser will be prompted to ask question in ask(X,Y)*/
/* 0 count is passed in when no questions have ever been asked*/
validate(Category):- write("you have chosen "), write(Category),nl, related(Category,Answer),nl,question(Category),nl,ask(Answer,0).



/*if count/num of questions asked is already then guesser is promtped to give a guess, guess is then passed in to predicate guess(X,Y)*/
/*or else the guesser is prompted to ask a qustion*/
/*question is then processed in predicated answer(X,Y,Z)*/
ask(Answer,Count) :- Count == 10, write("give a guess"),read(Guess), guess(Answer,Guess); write("ask a question"),nl,read(Question),answer(Answer,Question,Count).



/*question(X) will display the questions a guesser may ask based on the category chosen*/
question(Category):- Category = sports,write("1.teamsize[num], 2.playdevice, 3.indoor/outdoor, 4.dry/wet, 5.contact"),nl;
                     Category = animals,write("1.legs[num], 2.walk/swim/fly, 3.eatmeat/veg, 4.wild/pet, 5.mammal/bird/fish"),nl;
                     Category = food,write("1.spicy/salty/sweet, 2.local/forein/western, 3.without/withrice, 4.cheap/exp, 5.healthy/not"),nl;
                     Category = drinks,write("1.color, 2.cheap/exp, 3.iced/hot, 4.tea/fruitjuice, 5.sweet/sour/bitter/salty"),nl;
                     Category = carbrand,write("1.affordable/exp, 2.country, 3.homeused/sporty, 4.two/fourseater, 5.famous/notfamous"),nl.



/*related2(X,Y) determines whether the statement of a question asked is true/false, if true, yes is printed*/
/*if false, no is printed*/
/*in both cases, count(X,Y) is triggered*/
answer(Answer,Question,Count):-related2(Answer,Question),write("yes"),nl,count(Answer,Count),nl; write("no"),nl, count(Answer,Count).



/*as long as count is less than 10, we increment it by 1, and print out count, then proceed back to ask(X,Y) to make guess ask question*/
count(X,Z) :- Z<10, Z2 is Z +1 , write("count = "), write(Z2), nl, ask(X,Z2).


/*if the guesser guesses correctly, display 'correct', otherwise a correct answer is displayed*/
guess(A,B):- A = B, Hint = 'Correct! ', write(Hint).
guess(A,B):- not(A = B), Hint = 'Incorrect! ', write(Hint),nl,write("The answer is "),write(A).


/*related(X,Y) chooses an answer randomly for the guesser to guess, based on the category he/she chooses*/
related(X,Y):-
        X= sports, sports(L),random_member(Y,L);
        X= animals, animals(L),random_member(Y,L);
        X= food, food(L),random_member(Y,L);
        X= drinks, drinks(L),random_member(Y,L);
        X= carbrand, carbrand(L),random_member(Y,L).

/*related2(X,Y) compares the the question asked by the guesser, with the data in the knowledgebase to determines its true/false*/
related2(X,Y):- X=basketball, basketball(L),member(Y,L);
                X=tennis, tennis(L),member(Y,L);
                X=soccer, soccer(L),member(Y,L);
                X=tiger,  tiger(L),member(Y,L);
                X=chicken,chicken(L),member(Y,L);
                X=dog,    dog(L),member(Y,L);
                X=nasilemak, nasilemak(L),member(Y,L);
                X=frenchfries, frenchfries(L),member(Y,L);
                X=chickenrice, chickenrice(L),member(Y,L);
                X=milo, milo(L),member(Y,L);
                X=teh, teh(L),member(Y,L);
                X=orangejuice, orangejuice(L),member(Y,L);
                X=toyota, toyota(L),member(Y,L);
                X=lamborghini, lamborghini(L),member(Y,L);
                X=proton, proton(L),member(Y,L).

/*knowledgebase*/
/*category stores a list of answers*/
/*each answer then has a list of its own attributes*/
sports([basketball,tennis,soccer]).
basketball([teamsize5,ball,indoor,dry,contact]).
tennis([teamsize2,racket,indoor,dry,contactless]).
soccer([teamsize11,ball,outdoor,dry,contact]).

animals([tiger,chicken,dog]).
tiger([legs4,walk,eatmeat,wild,mammal]).
chicken([legs2,walk,eatveg,pet,bird]).
dog([legs4,walk,eatveg,pet,mammal]).

food([nasilemak,frenchfries,chickenrice]).
nasilemak([spicy,local,unhealthy,withrice,cheap]).
frenchfries([salty,western,unhealthy,withoutrice,cheap]).
chickenrice([salty,local,unheahlthy,withrice,cheap]).

drinks([milo,teh,orangejuice]).
milo([darkbrown,cheap,tea,iced,sweet]).
teh([lightbrown,cheap,tea,hot,sweet]).
orangejuice([orange,exp,fruitjuice,iced,sweet]).

carbrand([toyoto,lamborghini,proton]).
toyota([japan,affordable,homeused,fourseater,famous]).
lamborghini([italy,exp,sporty,twoseater,famous]).
proton([malaysia,affordable,homeused,fourseater,notfamous]).

