% collision after horizon restriction (bc there has to be a first collision)
collision((1,1),H+10) :- hrzn(H).

% detect collisions
collision((X,Y),T) :- pos(robot(R),(X,Y),T), pos(robot(R'),(X,Y),T), R!=R'.

% extract first collison
1{fcol(T): collision((_,_),T), collision((_,_),T'), T<=T'}1.
:- fcol(T), collision((_,_),T'), T>T'.

% adopt plan unitl first collision
occurs(object(robot,R),action(move,(U,V)),T) :- occ(object(robot,R),action(move,(U,V)),T), not collision((_,_),T), fcol(T'), T<T'.

% conditions that come with the adopted plan
move(robot(R),D,T) :- occurs(object(robot,R),action(move,D),T).
position(robot(R),C,T) :- pos(robot(R),C,T), occurs(object(robot,R),action(move,(_,_)),T).

#show.

#show occurs/3.
#show move/3.
#show position/3.
