% guess a number game.
% to play: guess(Minimum, Maximum, []).

% borrow from concatenate
concatenate([], List, List).
concatenate([Head|Tail1], List, [Head|Tail2]) :-
	concatenate(Tail1, List, Tail2).

% writeList: Write a list of values to screen
writeList([]).
writeList([Head|Tail]) :- write(Head), writeList(Tail).

% If A = B, write "Correct! " and A concatenated to the list of GuessesSoFar
equal(A, B, GuessesSoFar) :- A = B, Hint = 'Correct! ', write(Hint), concatenate([A], GuessesSoFar, Guesses), write(Guesses).
% If A < B, write "Higher. " and prompt for another guess
higher(A, B, GuessesSoFar) :- A < B, Hint = 'Higher. ', write(Hint),  concatenate([A], GuessesSoFar, Guesses), guess(Guesses, B).
% If A > B, write "Lower. " and prompt for another guess
lower(A, B, GuessesSoFar) :- A > B, Hint = 'Lower. ', write(Hint), concatenate([A], GuessesSoFar, Guesses), guess(Guesses, B).

% Prompt for a guess and respond appropriately
guess(Guesses, Number) :-
	read(Guess),
	(equal(Guess, Number, Guesses);	% The guess is a match
	higher(Guess, Number, Guesses); % OR the guess is too low
	lower(Guess, Number, Guesses)). % OR the guess is too high

% Play the game
guess(Lower, Upper, Guesses) :-
	writeList(['Try to guess a number between ', Lower, ' and ', Upper, '.']),
	random(Lower, Upper, Number),	% Get the random number
        guess(Guesses, Number).			% Start guessing
