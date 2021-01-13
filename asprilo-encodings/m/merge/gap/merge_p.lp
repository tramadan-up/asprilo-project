% some text
#include "./rightleft_collision_left.lp".

% collision after horizon restriction (bc there has to be a first collision)
collision((1,1),H+10) :- hrzn(H).
% detect collisions
collision((X,Y),T) :- pos(robot(R),(X,Y),T), pos(robot(R'),(X,Y),T), R!=R'.

% extract first collison
1{fcol(T): collision((_,_),T), collision((_,_),T'), T<=T'}1.
:- fcol(T), collision((_,_),T'), T>T'.

% adopt plan until first collision
occurs(object(robot,R),action(move,(U,V)),T) :- occ(object(robot,R),action(move,(U,V)),T), not collision((_,_),T), fcol(T'), T<T'.

% classification of collision (what is the position before the collision? -> in which direction does one of the robots move? -> right=1, up=2, down=3)
ccol((X,Y),T,1) :- collision((X,Y),T), fcol(T), pos(robot(R),(X-1,Y),T-1), pos(robot(R'),(X+1,Y),T-1), R!=R'.
ccol((X,Y),T,2) :- collision((X,Y),T), fcol(T), pos(robot(R),(X,Y+1),T-1), pos(robot(R'),(X,Y-1),T-1), R!=R'.
ccol((X,Y),T,1) :- collision((X,Y),T), fcol(T), pos(robot(R),(X-1,Y),T-1), pos(robot(R'),(X,Y+1),T-1), R!=R'.
ccol((X,Y),T,2) :- collision((X,Y),T), fcol(T), pos(robot(R),(X+1,Y),T-1), pos(robot(R'),(X,Y+1),T-1), R!=R'.
ccol((X,Y),T,1) :- collision((X,Y),T), fcol(T), pos(robot(R),(X-1,Y),T-1), pos(robot(R'),(X,Y-1),T-1), R!=R'.
ccol((X,Y),T,3) :- collision((X,Y),T), fcol(T), pos(robot(R),(X+1,Y),T-1), pos(robot(R'),(X,Y-1),T-1), R!=R'.

% one robot moves right
occurs(object(robot,R),action(move,(1,0)),T) :- ccol((X,Y),T,C), pos(robot(R),(X-1,Y),T-1), pos(robot(R),(X,Y),T), C==1.

% one robot moves up
occurs(object(robot,R),action(move,(0,1)),T) :- ccol((X,Y),T,C), pos(robot(R),(X,Y+1),T-1), pos(robot(R),(X,Y),T), C==2.

% one robot moves down
occurs(object(robot,R),action(move,(0,-1)),T) :- ccol((X,Y),T,C), pos(robot(R),(X,Y-1),T-1), pos(robot(R),(X,Y),T), C==3.


% switching places (collision is: 1=left, 2=right, 3=up, 4=down)
% normally switching places
switching_places((X,Y),T,R,R',1) :- collision((X,Y),T), fcol(T), pos(robot(R),(X,Y),T-1), pos(robot(R'),(X+1,Y),T-1), R!=R'.
switching_places((X,Y),T,R,R',2) :- collision((X,Y),T), fcol(T), pos(robot(R),(X,Y),T-1), pos(robot(R'),(X-1,Y),T-1), R!=R'.
switching_places((X,Y),T,R,R',3) :- collision((X,Y),T), fcol(T), pos(robot(R),(X,Y),T-1), pos(robot(R'),(X,Y-1),T-1), R!=R'.
switching_places((X,Y),T,R,R',4) :- collision((X,Y),T), fcol(T), pos(robot(R),(X,Y),T-1), pos(robot(R'),(X,Y+1),T-1), R!=R'.
% robots are forced to switch places
switching_places((X,Y),T,R,R',1) :- ccol((X,Y),T,C), pos(robot(R),(X+1,Y),T+1), pos(robot(R'),(X,Y),T), pos(robot(R'),(X+1,Y),T-1), occurs(object(robot,R),action(move,(_,_)),T), R!=R'.
switching_places((X,Y),T,R,R',2) :- ccol((X,Y),T,C), pos(robot(R),(X-1,Y),T+1), pos(robot(R'),(X,Y),T), pos(robot(R'),(X-1,Y),T-1), occurs(object(robot,R),action(move,(_,_)),T), R!=R'.
switching_places((X,Y),T,R,R',3) :- ccol((X,Y),T,C), pos(robot(R),(X,Y+1),T+1), pos(robot(R'),(X,Y),T), pos(robot(R'),(X,Y+1),T-1), occurs(object(robot,R),action(move,(_,_)),T), R!=R'.
switching_places((X,Y),T,R,R',4) :- ccol((X,Y),T,C), pos(robot(R),(X,Y-1),T+1), pos(robot(R'),(X,Y),T), pos(robot(R'),(X,Y-1),T-1), occurs(object(robot,R),action(move,(_,_)),T), R!=R'.

% pooling (looking for a gap two swap), code currently only works if there is a gap to search for
% pool to the right 
pool((X,Y),(X',Y),1,S) :- switching_places((X,Y),T,R,R',1), not solvable((X,Y),T,1,_), position((X',Y-1)), X'=X+2..T', T'=H-T, hrzn(H), S=(X'-X).
% nearest gap
1{mpool((X,Y),(Z,Y),1,S): pool((X,Y),(Z,Y),1,S), pool((X,Y),(Z',Y),1,S'), Z!=Z', S<=S'}1.
:- mpool((X,Y),(_,Y),1,S), pool((X,Y),(_,Y),1,S'), S>S'.
% robots move together to the gap
switching_places((X',Y),T',R,R',1) :- switching_places((X,Y),T,R,R',1), pool((X,Y),(X',Y),1,S), mpool((X,Y),(X',Y),1,S), T'=T+S.
occurs(object(robot,R),action(move,(1,0)),(T+1)..T') :- switching_places((X,Y),T,R,R',1), mpool((X,Y),(X',Y),1,S), switching_places((X',Y),T',R,R',1).
occurs(object(robot,R'),action(move,(1,0)),(T+1)..T') :- switching_places((X,Y),T,R,R',1), mpool((X,Y),(X',Y),1,S), switching_places((X',Y),T',R,R',1).
%%%
% with pooling
% one robot needs to move to the original collision
%occurs(object(robot,R'),action(move,(-1,0)),(T'+2)..(T'+S+1)) :- collision_class((X,Y),T,R,R',1), mpool((X,Y),(X',Y),1,S), collision_class((X',Y),T',R,R',1), solvable_collision((X',Y),T',1,1).
% adopt plans from fixpoints respectively
%occurs(object(robot,R),action(move,(U,V)),T+2) :- occurs_(object(robot,R),action(move,(U,V)),T), solvable_collision((X,Y),T',1,1), collision_class((X,Y),T',R,R',1), T>=T', mpool((_,Y),(X,Y),1,_).
%occurs(object(robot,R'),action(move,(U,V)),T+1+(2*S)) :- occurs_(object(robot,R'),action(move,(U,V)),T), collision_class((X,Y),T',R,R',1), T>=T', mpool((X,Y),(_,Y),1,S).
%%%

#show.

#show occurs/3.
#show switching_places/5.
#show position/1.
#show solvable/4.
#show pool/4.
#show mpool/4.
