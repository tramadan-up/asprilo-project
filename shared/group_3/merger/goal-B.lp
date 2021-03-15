
serves(S,P) :- position(R,C,T), carries(R,S,T), position(P,C).

process(O,A) :- ordered(O,A), target(O,P), shelved(S,A), serves(S,P).
processed(O) :- process(O,_).

:- ordered(O,_), not processed(O).

:- position(_,C,horizon), position(_,C).
:- not position(S,C,horizon), position(S,C,0), isShelf(S).
:- carries(_,_,horizon).
