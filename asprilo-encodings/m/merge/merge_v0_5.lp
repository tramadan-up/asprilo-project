% import modified action-M.lp
#include "./encoding/action-M-m-mod.lp".
% time management
% set time for new plan dynamically
time(1..T+1) :- first_collision(T).
time(T+1..(R+S)) :- first_collision(T), range(R,_), steps(S,_).
% set time for randomly generated moves
random_time((T')..(T'+5)) :- first_collision(T').
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

1{max_time(T): time(T), time(T'), T>=T'}1 :- time(_).
:- max_time(T), time(T), time(T'), T<T'.

1{max_range(T,robot(R)): position_im(robot(R),_,T), position_im(robot(R),_,T'), T>=T'}1 :- position_im(robot(R),_,_).
:- max_range(T,robot(R)), position_im(robot(R),_,T), position_im(robot(R),_,T'), T<T'.

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
% set checkpoint after collision, if goal is far away
checkpoint(C,robot(R),1) :-  position_im(robot(R),C,T+1), first_collision(T), max_range(T',robot(R)), T'-T>=4.
checkpoint(C,robot(R),2) :-  position_im(robot(R),C,T'), first_collision(T), max_range(T',robot(R)), T'-T<4.
:- checkpoint(C,robot(R),2), not position(robot(R),C,T), max_time(T).
:- checkpoint(C,robot(R),1), not position(robot(R),C,_).
% calculate and minimize steps for each robot
steps(S,robot(R)) :- random_position(robot(R),C,T), checkpoint(C,robot(R),_), first_collision(T'), S=T-(T'-1).
#minimize {S: steps(S,_) }.

% set movement according to amount of steps
move(robot(R),D,T) :- random_move(robot(R),D,T), steps(S,robot(R)), first_collision(T'), T<=(T'-1)+S.
% adopt original plan after that
move(robot(R),D,T+S-2) :- move_im(robot(R),D,T), steps(S,robot(R)), first_collision(T'), checkpoint(_,robot(R),1), T>T'+1.

% translating moves into positions
%position(robot(R),C,T) :- move(robot(R),D,T), position(robot(R),C',T-1), nextto(C',D,C).
%:- move(robot(R),D,T), position(robot(R),C,T-1), not nextto(C,D,_).
%random_position(robot(R),C,T) :- random_move(robot(R),D,T), random_position(robot(R),C',T-1), nextto(C',D,C).
%:- random_move(robot(R),D,T), random_position(robot(R),C,T-1), not nextto(C,D,_).

% restrictions to robot movement and positioning
:- move(robot(R),D,T), move(robot(R),D',T), D!=D'.
:- random_move(robot(R),D,T), random_move(robot(R),D',T), D!=D'.
:- position(robot(R),C,_), isRobot(robot(R)), not position(C).
:- position(robot(R),C,T), position(robot(R'),C,T), R!=R'.
:- random_position(robot(R),C,_), isRobot(robot(R)), not position(C).
:- random_position(robot(R),C,T), random_position(robot(R'),C,T), R!=R'.

%:- position(robot(R),C,T-1), position(robot(R),C',T), position(robot(R'),C',T-1), position(robot(R'),C,T), R!=R'.
%:- random_position(robot(R),C,T-1), random_position(robot(R),C',T), random_position(robot(R'),C',T-1), random_position(robot(R'),C,T), R!=R'.

#show.
#show occurs(object(robot,R), action(move,D),     T) :    move(robot(R),D,T).
#show max_range/2.
#show checkpoint/3.
#show range/2.
