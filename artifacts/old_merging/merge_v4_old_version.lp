% time
time(1..T+1) :- first_collision(T).
% pos0
position(robot(R),C,0) :- position_im(robot(R),C,0).
% robots want to enter the same node simultaneously
collision((X,Y),T,robot(R),robot(R'),1) :- position_im(robot(R),(X,Y),T), position_im(robot(R'),(X,Y),T), R!=R', not collision((X,Y),T,robot(R'),robot(R),_).

% robots want to switch places
collision((X,Y),T,robot(R),robot(R'),2) :- position_im(robot(R),(X,Y),T), position_im(robot(R'),(X',Y'),T), position_im(robot(R),(X',Y'),T+1), position_im(robot(R'),(X,Y),T+1), R!=R', not collision(_,T,robot(R'),robot(R),_).

collision((X,Y),T,R,R',1) :- position_im(robot(R),(X,Y),T'), position_im(robot(R'),(X,Y),T), not position_im(robot(R),_,T'+P), S=T-T', P=1..S, T'<T, R!=R'.

% find first collison
1{first_collision(T): collision(_,T,_,_,_), collision(_,T',_,_,_), T<=T'}1 :- collision(_,_,_,_,_).
:- first_collision(T), collision(_,T,_,_,_), collision(_,T',_,_,_), T>T'.

% adopt plans w/o any collisions
move(robot(R),D,T) :- move_im(robot(R),D,T), not collision(_,_,_,_,_).

% adopt plan for dominant robot until T'
move(robot(R),D,T) :- move_im(robot(R),D,T), collision(_,T',robot(R),_,_), first_collision(T'), T<T'.
position(robot(R),C,T) :- position_im(robot(R),C,T), collision(_,T',robot(R),_,_), first_collision(T'), T<T'.

% devot robot until T'
move(robot(R'),D,T) :- move_im(robot(R'),D,T), collision(_,T',_,robot(R'),_), first_collision(T'), T<T'.
position(robot(R'),C,T) :- position_im(robot(R'),C,T), collision(_,T',_,robot(R'),_), first_collision(T'), T<T'.

% generate random movement
{ rmove(robot(R),D,T) : direction(D) } :- rtime(T), isRobot(robot(R)), collision(_,T',_,_,_), T>=T'.

rposition(robot(R),C,T-1) :- position(robot(R),C,T-1), collision(_,T,robot(R),_,_), first_collision(T).
rposition(robot(R'),C,T-1) :- position(robot(R'),C,T-1), collision(_,T,_,robot(R'),_), first_collision(T).

rposition(robot(R),C,T) :- rmove(robot(R),D,T), rposition(robot(R),C',T-1), nextto(C',D,C).
:- rmove(robot(R),D,T), rposition(robot(R),C,T-1), not nextto(C,D,_).

% - inertia ---------------------------------------------------------------------
rposition(robot(R),C,T) :- rposition(robot(R),C,T-1), not rmove(robot(R),_,T), isRobot(robot(R)), rtime(T).

% - edge collision --------------------------------------------------------------
moveto(C',C,T) :- nextto(C',D,C), rposition(robot(R),C',T-1), rmove(robot(R),D,T).
:- moveto(C',C,T), moveto(C,C',T), C < C'.

% - vertex collision ------------------------------------------------------------
:- { rposition(robot(R),C,T) : isRobot(robot(R)) }  > 1, position(C), rtime(T).

% - auxiliaries -----------------------------------------------------------------
 :- { rposition(robot(R),C,T) } != 1, isRobot(robot(R)), rtime(T).    % REDUNDANT but PERFORMANT?
%--------------------------------------------------------------------------------

% the next couple of lines are part of the original encoding
%--------------------------------------------------------------------------------
% - move/3 ----------------------------------------------------------------------
position(robot(R),C,T) :- move(robot(R),D,T), position(robot(R),C',T-1), nextto(C',D,C).
:- move(robot(R),D,T), position(robot(R),C,T-1), not nextto(C,D,_).

% - inertia ---------------------------------------------------------------------
position(robot(R),C,T) :- position(robot(R),C,T-1), not move(robot(R),_,T), isRobot(robot(R)), time(T).

% - edge collision --------------------------------------------------------------
moveto(C',C,T) :- nextto(C',D,C), position(robot(R),C',T-1), move(robot(R),D,T).
:- moveto(C',C,T), moveto(C,C',T), C < C'.

% - vertex collision ------------------------------------------------------------
:- { position(robot(R),C,T) : isRobot(robot(R)) }  > 1, position(C), time(T).

% - auxiliaries -----------------------------------------------------------------
 :- { position(robot(R),C,T) } != 1, isRobot(robot(R)), time(T).    % REDUNDANT but PERFORMANT?
%--------------------------------------------------------------------------------

% restriction to robot movement and positioning
:- move(robot(R),D,T), move(robot(R),D',T), D!=D'.
:- rmove(robot(R),D,T), rmove(robot(R),D',T), D!=D'.
:- position(robot(R),C,_), isRobot(robot(R)), not position(C).
:- position(robot(R),C,T), position(robot(R'),C,T), R!=R'.

% set checkpoints
checkpoint(C,robot(R)) :- collision(_,T,robot(R),_,_), position_im(robot(R),C,T+1).
checkpoint(C,robot(R')) :- collision(_,T,_,robot(R'),_), position_im(robot(R'),C,T+1).
:- checkpoint(C,robot(R)), not position(robot(R),C,_).
:- checkpoint(C,robot(R')), not position(robot(R'),C,_).


% calculate and minimize steps
step(S) :- rposition(robot(R),C,T), checkpoint(C,robot(R)), collision(_,T',robot(R),_,_), S=T-(T'-1).
#minimize {S: step(S) }.

steps(S) :- rposition(robot(R'),C,T), checkpoint(C,robot(R')), collision(_,T',_,robot(R'),_), S=T-(T'-1).
#minimize {S: steps(S) }.


move(robot(R),D,T) :- rmove(robot(R),D,T), step(S), collision(_,T',robot(R),_,_), T<=(T'-1)+S.
move(robot(R'),D,T) :- rmove(robot(R'),D,T), steps(S), collision(_,T',_,robot(R'),_), T<=(T'-1)+S.

move(robot(R),D,T+S-2) :- move_im(robot(R),D,T), collision(_,T',robot(R),_,_), step(S), T>T'+1.
move(robot(R'),D,T+S-2) :- move_im(robot(R'),D,T), collision(_,T',_,robot(R'),_), steps(S), T>T'+1.

rtime((T')..(T'+5)) :- collision(_,T',_,_,_).
time(1..(R+S)) :- range(R), step(S).
time(1..(R+S)) :- range(R), steps(S).

#show.
#show occurs(object(robot,R), action(move,D),     T) :    move(robot(R),D,T).
#show step/1.
#show steps/1.
