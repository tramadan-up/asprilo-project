% some text

gap((X,Y),(X',Y'),T',S) :- collision_class((X,Y),T,R,R',C), not solvable_collision((X,Y),T,_), position((X',Y'-1)), position((X'-1,Y')), position((X'+1,Y')), position_(robot(R),(X',Y'),T'), S=T'-T, T'>T.
gap((X,Y),(X',Y'),T',S) :- collision_class((X,Y),T,R,R',C), not solvable_collision((X,Y),T,_), position((X',Y'+1)), position((X'-1,Y')), position((X'+1,Y')), position_(robot(R),(X',Y'),T'), S=T'-T, T'>T.
gap((X,Y),(X',Y'),T',S) :- collision_class((X,Y),T,R,R',C), not solvable_collision((X,Y),T,_), position((X'-1,Y')), position((X',Y'-1)), position((X',Y'+1)), position_(robot(R),(X',Y'),T'), S=T'-T, T'>T.
gap((X,Y),(X',Y'),T',S) :- collision_class((X,Y),T,R,R',C), not solvable_collision((X,Y),T,_), position((X'+1,Y')), position((X',Y'-1)), position((X',Y'+1)), position_(robot(R),(X',Y'),T'), S=T'-T, T'>T.


1{first_gap(T): gap((_,_),(_,_),T,_), gap((_,_),(_,_),T',_), T<=T'}1 :- gap((_,_),(_,_),_,_).
:- first_gap(T), gap((_,_),(_,_),T,_), gap((_,_),(_,_),T',_), T>T'.

% classification of the new collision
collision_class((X',Y'),T',R,R',1) :- collision_class((X,Y),T,R,R',_), gap((X,Y),(X',Y'),T',S), first_gap(T'), S=T'-T, occurs_(object(robot,R),action(move,(1,0)),T').
collision_class((X',Y'),T',R,R',2) :- collision_class((X,Y),T,R,R',_), gap((X,Y),(X',Y'),T',S), first_gap(T'), S=T'-T, occurs_(object(robot,R),action(move,(-1,0)),T').
collision_class((X',Y'),T',R,R',3) :- collision_class((X,Y),T,R,R',_), gap((X,Y),(X',Y'),T',S), first_gap(T'), S=T'-T, occurs_(object(robot,R),action(move,(0,1)),T').
collision_class((X',Y'),T',R,R',4) :- collision_class((X,Y),T,R,R',_), gap((X,Y),(X',Y'),T',S), first_gap(T'), S=T'-T, occurs_(object(robot,R),action(move,(0,-1)),T').


% robots move together to the gap
occurs(object(robot,R),action(move,(U,V)),T) :- occurs_(object(robot,R),action(move,(U,V)),T), collision_class((X,Y),T_,R,R',_), collision_class((X',Y'),T',R,R',_), first_gap(T'), T<=T', T>T_.
occurs(object(robot,R'),action(move,(U,V)),T) :- occurs(object(robot,R),action(move,(U,V)),(T+1)), collision_class((X,Y),T_,R,R',_), collision_class((X',Y'),T',R,R',_), first_gap(T'), T<T', T>T_.
occurs(object(robot,R'),action(move,(U,V)),T) :- occurs(object(robot,R),action(move,(U,V)),T), collision_class((X',Y'),T,R,R',_), first_gap(T).


% devot robot needs to move to the original collision
occurs(object(robot,R'),action(move,(U,V)),T+2+P) :- occurs(object(robot,R),action(move,(U',V')),T-P), collision_class((X,Y),T',R,R',_), first_gap(T), gap((X,Y),(X',Y'),T,S), solvable_collision((X',Y'),T,_), U=U'*(-1), V=V'*(-1), P=0..S-1.

