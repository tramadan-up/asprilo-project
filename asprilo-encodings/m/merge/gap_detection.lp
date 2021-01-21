% this part isn't yet implemented

gap((X,Y),(X',Y),1,S) :- collision_class((X,Y),T,R,R',C), not solvable_collision((X,Y),T,_), position((X',Y-1)), position_(robot(R),(X..X',Y),T), X'=X+2..T', T'=H-T, hrzn(H), S=(X'-X), C<3.

% nearest gap
1{first_gap((X,Y),(Z,Y),1,S): gap((X,Y),(Z,Y),1,S), gap((X,Y),(Z',Y),1,S'), Z!=Z', S<=S'}1 :- gap((_,_),(_,_),_,_).
:- first_gap((X,Y),(_,Y),1,S), gap((X,Y),(_,Y),1,S'), S>=S'.




% robots move together to the gap
collision_class((X',Y),T',R,R',1) :- collision_class((X,Y),T,R,R',1), gap((X,Y),(X',Y),1,S), first_gap((X,Y),(X',Y),1,S), T'=T+S.
occurs(object(robot,R),action(move,(1,0)),(T+1)..T') :- collision_class((X,Y),T,R,R',1), first_gap((X,Y),(X',Y),1,S), collision_class((X',Y),T',R,R',1).
occurs(object(robot,R'),action(move,(1,0)),(T+1)..T') :- collision_class((X,Y),T,R,R',1), first_gap((X,Y),(X',Y),1,S), collision_class((X',Y),T',R,R',1).


% one robot needs to move to the original collision
occurs(object(robot,R'),action(move,(-1,0)),(T'+2)..(T'+S+1)) :- collision_class((X,Y),T,R,R',1), first_gap((X,Y),(X',Y),1,S), collision_class((X',Y),T',R,R',1), solvable_collision((X',Y),T',1,1).
% adopt plans from fixpoints respectively
occurs(object(robot,R),action(move,(U,V)),T+2) :- occurs_(object(robot,R),action(move,(U,V)),T), solvable_collision((X,Y),T',1,1), collision_class((X,Y),T',R,R',1), T>=T', first_gap((_,Y),(X,Y),1,_).
occurs(object(robot,R'),action(move,(U,V)),T+1+(2*S)) :- occurs_(object(robot,R'),action(move,(U,V)),T), collision_class((X,Y),T',R,R',1), T>=T', first_gap((X,Y),(_,Y),1,S).




%strat: search for gap, move to it

stuck() :- collision_class(), not solvable_collision().
gap() :- stuck(), position(), position_().
first_gap().

%move to first_gap
%resolve
%restructure plans
