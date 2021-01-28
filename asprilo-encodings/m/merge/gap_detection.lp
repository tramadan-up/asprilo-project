%strategy:
%%%
%gap on path of dominant robot?
%yes: find first gap, move to gap, resolve collision, move devot robot to original collision, adopt plans form checkpoints respectively
%no: find gap, set checkpoint for dominant robot (on its path), move to checkpoint/gap, resolve, move back to checkpoints (checkpoint/original collision), adopt plans
%%%


gap((X,Y),(X',Y'),T',S) :- collision_class((X,Y),T,R,R',C), not solvable_collision((X,Y),T,_), position((X',Y'-1)), position((X'-1,Y')), position((X'+1,Y')), position_(robot(R),(X',Y'),T'), S=T'-T, T'>T.
gap((X,Y),(X',Y'),T',S) :- collision_class((X,Y),T,R,R',C), not solvable_collision((X,Y),T,_), position((X',Y'+1)), position((X'-1,Y')), position((X'+1,Y')), position_(robot(R),(X',Y'),T'), S=T'-T, T'>T.
gap((X,Y),(X',Y'),T',S) :- collision_class((X,Y),T,R,R',C), not solvable_collision((X,Y),T,_), position((X'-1,Y')), position((X',Y'-1)), position((X'+1,Y'+1)), position_(robot(R),(X',Y'),T'), S=T'-T, T'>T.
gap((X,Y),(X',Y'),T',S) :- collision_class((X,Y),T,R,R',C), not solvable_collision((X,Y),T,_), position((X'+1,Y')), position((X',Y'-1)), position((X',Y'+1)), position_(robot(R),(X',Y'),T'), S=T'-T, T'>T.


1{first_gap(T): gap((_,_),(_,_),T,_), gap((_,_),(_,_),T',_), T<=T'}1 :- gap((_,_),(_,_),_,_).
:- first_gap(T), gap((_,_),(_,_),T,_), gap((_,_),(_,_),T',_), T>T'.


% robots move together to the gap
collision_class((X',Y'),T',R,R',C) :- collision_class((X,Y),T,R,R',C), gap((X,Y),(X',Y'),T',S), first_gap(T'), S=T'-T.

occurs(object(robot,R),action(move,(U,V)),(T+1)..T') :- occurs_(object(robot,R),action(move,(U,V)),(T+1)..T'), collision_class((X,Y),T,R,R',C), collision_class((X',Y'),T',R,R',C), first_gap(T').
occurs(object(robot,R'),action(move,(U,V)),(T+1)..T') :- occurs(object(robot,R),action(move,(U,V)),(T+1)..T'), collision_class((X,Y),T,R,R',C), collision_class((X',Y'),T',R,R',C), first_gap(T').

% devot robot needs to move to the original collision
occurs(object(robot,R'),action(move,(U',V')),(T'+2)..(T'+S+1)) :- occurs(object(robot,R'),action(move,(U,V)),(T+1)..T'), collision_class((X,Y),T,R,R',C), first_gap(T'), collision_class((X',Y'),T',R,R',C), gap((X,Y),(X',Y'),T',S), solvable_collision((X',Y),T',_), U'==U*(-1), V'==V*(-1).


