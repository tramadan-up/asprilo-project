% import modified action-M.lp
#include "./encoding/action-M-m-mod.lp".

% time management
% set time for new plan dynamically
time(1..T+1) :- first_collision(T).
time(T+1..(R+S)) :- first_collision(T), range(R,_), steps(S,_).
% set time for randomly generated moves
random_time((T')..(T'+20)) :- first_collision(T').

% import first position of each robot
position(robot(R),C,0) :- position_im(robot(R),C,0).

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

% adopt plans if there aren't any collisions any collisions
move(robot(R),D,T) :- move_im(robot(R),D,T), not collision(_,_,_,_).


% adopt plan for all robots until T' (first collision)
move(robot(R),D,T) :- move_im(robot(R),D,T), first_collision(T'), T<T'.
position(robot(R),C,T) :- position_im(robot(R),C,T), first_collision(T'), T<T'.

% set first random positions to one timestep before the first collision
random_position(robot(R),C,T-1) :- position(robot(R),C,T-1), first_collision(T).

% generate random movement
{ random_move(robot(R),D,T) : direction(D) } :- random_time(T), isRobot(robot(R)), first_collision(T'), T>=T'.


% set checkpoints
checkpoint(C,robot(R)) :-  position_im(robot(R),C,H), range(H,R).
:- checkpoint(C,robot(R)), not position(robot(R),C,_).

% calculate and minimize steps for each robot
steps(S,robot(R)) :- random_position(robot(R),C,T), checkpoint(C,robot(R)), first_collision(T'), S=T-(T'-1).
#minimize {S: steps(S,_) }.

% set movement according to amount of steps
move(robot(R),D,T) :- random_move(robot(R),D,T), steps(S,robot(R)), first_collision(T'), T<=(T'-1)+S.

% restrictions to robot movement and positioning
:- move(robot(R),D,T), move(robot(R),D',T), D!=D'.
:- random_move(robot(R),D,T), random_move(robot(R),D',T), D!=D'.
:- position(robot(R),C,_), isRobot(robot(R)), not position(C).
:- position(robot(R),C,T), position(robot(R'),C,T), R!=R'.
:- random_position(robot(R),C,_), isRobot(robot(R)), not position(C).
:- random_position(robot(R),C,T), random_position(robot(R'),C,T), R!=R'.

#show.
#show occurs(object(robot,R), action(move,D),     T) :    move(robot(R),D,T).
#show first_collision/1.
