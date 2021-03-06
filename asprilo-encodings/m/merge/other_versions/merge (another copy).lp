% import modified action-M.lp
#include "./encoding/action-M-m-mod.lp".
% time management
% set time for new plan dynamically
% starting with the first collision point
time(1..T+1) :- first_collision(T).
% and adding to it depending on the steps needed
time(T+1..(R+S)) :- first_collision(T), range(R), steps(S,_).
range(horizon).
% set time for randomly generated moves
random_time((T')..(T'+8)) :- first_collision(T').
%random_time_end((T'-B)..(T')) :- max_time(T'), b(B).

robot(R) :- init(object(robot,R),_).
isRobot(robot(R)) :- robot(R).
% directions
direction((X,Y)) :- X=-1..1, Y=-1..1, |X+Y|=1.
direction((0,0)).
% nextto
nextto((X,Y),(DX,DY),(X',Y')) :- direction((DX,DY)), position((X,Y)), position((X',Y')), (X,Y)=(X'-DX,Y'-DY), (X',Y')=(X+DX,Y+DY).


% import positions
position((X,Y)) :- init(object(node,N),value(at,(X,Y))).
% import first position of each robot
position_im(robot(R),(X,Y),0) :- init(object(robot,R),value(at,(X,Y))).
position_im(robot(R),(X+DX,Y+DY),T+1) :- occurs_im(object(robot,R),action(move,(DX,DY)),T+1), position_im(robot(R),(X,Y),T).
a(5).
b(A-1) :- a(A).
% collision detection
% robots want to enter the same node simultaneously
collision((X,Y),T,robot(R),robot(R')) :- position_im(robot(R),(X,Y),T), position_im(robot(R'),(X,Y),T), R!=R', not collision((X,Y),T,robot(R'),robot(R)).

% robots want to switch places
collision((X,Y),T,robot(R),robot(R')) :- position_im(robot(R),(X,Y),T), position_im(robot(R'),(X',Y'),T), position_im(robot(R),(X',Y'),T+1), position_im(robot(R'),(X,Y),T+1), R!=R', not collision(_,T,robot(R'),robot(R)).

% one robot standing still (might need a little bit of work)
collision((X,Y),T,R,R') :- position_im(robot(R),(X,Y),T'), position_im(robot(R'),(X,Y),T), not position_im(robot(R),_,T'+P), S=T-T', P=1..S, T'<T, R!=R'.

% find first collison
1{first_collision(T): collision(_,T,_,_), collision(_,T',_,_), T<=T'}1 :- collision(_,_,_,_).
:- first_collision(T), collision(_,T,_,_), collision(_,T',_,_), T>T'.

1{max_time(T): time(T), time(T'), T>=T'}1 :- time(_).
:- max_time(T), time(T), time(T'), T<T'.


1{max_range(T,robot(R)): position_im(robot(R),_,T), position_im(robot(R),_,T'), T>=T'}1 :- position_im(robot(R),_,_).
:- max_range(T,robot(R)), position_im(robot(R),_,T), position_im(robot(R),_,T'), T<T'.

% adopt plans if there aren't any collisions any collisions
position(robot(R),C,T) :- position_im(robot(R),C,T), not collision(_,_,_,_).

% adopt plan for all robots until T' (first collision)
position(robot(R),C,T) :- position_im(robot(R),C,T), first_collision(T'), T<T'.

% set first random positions to one timestep before the first collision
random_position(robot(R),C,T-1) :- position(robot(R),C,T-1), first_collision(T).

% generate random movement
{ random_position(robot(R),C,T) : position(C) } :- random_time(T), isRobot(robot(R)), first_collision(T'), T>=T'.

% set checkpoints
% set checkpoint after collision, if goal is far away
checkpoint(C,robot(R),1,1) :-  position_im(robot(R),C,T+1), first_collision(T), max_range(T',robot(R)), T'-T>=4.
% set checkpoint at goal if its near
checkpoint(C,robot(R),1,2) :-  position_im(robot(R),C,T'), first_collision(T), max_range(T',robot(R)), T'-T<4.
:- checkpoint(C,robot(R),1,2), not position(robot(R),C,T), max_time(T).
:- checkpoint(C,robot(R),1,1), not position(robot(R),C,_).
% calculate and minimize steps for each robot
steps(S,robot(R)) :- random_position(robot(R),C,T), checkpoint(C,robot(R),1,_), first_collision(T'), S=T-(T'-1).
#minimize {S: steps(S,_) }.

% set movement according to amount of steps
position(robot(R),C,T) :- random_position(robot(R),C,T), steps(S,robot(R)), first_collision(T'), T<=(T'-1)+S.
% adopt original plan after that
position(robot(R),C,T+S-2) :- position_im(robot(R),C,T), steps(S,robot(R)), first_collision(T'), checkpoint(_,robot(R),1,1), max_time(T_), a(A), T>T'+1, T<=T_-A.

% set first random position before end randomization
%random_position_end(robot(R),C,T-A) :- position(robot(R),C,T-A), max_time(T), a(A).

% generate random movement
%{ random_position_end(robot(R),C,T) : position(C) } :- random_time_end(T), isRobot(robot(R)), max_time(T'), b(B), T>=T'-B.
%set new checkpoint
%checkpoint(C,robot(R),2,2) :-  position_im(robot(R),C,T), max_range(T,robot(R)), not checkpoint(_,robot(R),1,2).
%:- checkpoint(C,robot(R),2,2), not position(robot(R),C,T), max_time(T).

% set movement according to amount of steps
%position(robot(R),C,T) :- random_position_end(robot(R),C,T), max_time(T'), b(B), T<=T', T>=T'-B.


% restrictions to robot movement and positioning
:- position(robot(R),C,_), isRobot(robot(R)), not position(C).
:- position(robot(R),C,T), position(robot(R'),C,T), R!=R'.
:- random_position(robot(R),C,_), isRobot(robot(R)), not position(C).
:- random_position(robot(R),C,T), random_position(robot(R'),C,T), R!=R'.
%:- random_position_end(robot(R),C,_), isRobot(robot(R)), not position(C).
%:- random_position_end(robot(R),C,T), random_position_end(robot(R'),C,T), R!=R'.
:- position(robot(R),C,T-1), position(robot(R),C',T), position(robot(R'),C',T-1), position(robot(R'),C,T), R!=R'.
:- random_position(robot(R),C,T-1), random_position(robot(R),C',T), random_position(robot(R'),C',T-1), random_position(robot(R'),C,T), R!=R'.
%:- random_position_end(robot(R),C,T-1), random_position_end(robot(R),C',T), random_position_end(robot(R'),C',T-1), random_position_end(robot(R'),C,T), R!=R'.
occurs(object(robot,R),action(move,D),T) :- position(robot(R),C,T), position(robot(R),C',T-1), nextto(C',D,C).


#show.
#show occurs/3.
