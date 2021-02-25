% time
time(1..(2*R)) :- range(R).

position(robot(R),C,0) :- position_im(robot(R),C,0).
% robots want to enter the same node simultaneously
collision((X,Y),T,R,R',1) :- position_im(robot(R),(X,Y),T), position_im(robot(R'),(X,Y),T), R!=R', not collision((X,Y),T,R',R,_).

% robots want to switch places
collision((X,Y),T,R,R',2) :- position_im(robot(R),(X,Y),T), position_im(robot(R'),(X',Y'),T), position_im(robot(R),(X',Y'),T+1), position_im(robot(R'),(X,Y),T+1), R!=R', not collision(_,T,R',R,_).

% one robot stands still - not working
%collision((X,Y),T,R,R',1) :- position_im(robot(R),(X,Y),T'), position_im(robot(R'),(X,Y),T), not position_im(robot(R),_,T'+P), S=T-T', P=1..S, T'<T, R!=R'.

% find first collison
1{first_collision(T): collision((_,_),T,_,_,_), collision((_,_),T',_,_,_), T<=T'}1 :- collision((_,_),_,_,_,_).
:- first_collision(T), collision((_,_),T,_,_,_), collision((_,_),T',_,_,_), T>T'.


% adopt plans w/o any collisions
move(robot(R),D,T) :- move_im(robot(R),D,T), not collision(_,_,_,_,_).

% adopt plans until first collision

% until T' (+ amount of steps S-1) 
%move(robot(R),D,T) :- move_im(robot(R),D,T), collision(_,T',R,R',_), first_collision(T'), T<T'.
% adopt plan for dominant robot without change
move(robot(R),D,T) :- move_im(robot(R),D,T), collision(_,T',R,R',_), first_collision(T').
position(robot(R),(X,Y),T) :- position_im(robot(R),(X,Y),T), collision(_,T',R,R',_), first_collision(T').

% devot robot until T'
move(robot(R'),D,T) :- move_im(robot(R'),D,T), collision(_,T',R,R',_), first_collision(T'), T<T'.
position(robot(R),C,T) :- position_im(robot(R),C,T), collision(_,T',_,R,_), first_collision(T'), T<T'.

% random movement
%{ move(robot(R),D,T) : direction(D) } 1 :- time(T), collision(_,T',_,R,_), T>=T'.
{ move(robot(R),D,T) : direction(D), time(T) } :- collision(_,T',_,R,_), T>=T'.



% the next couple of lines are part of the original encoding
%--------------------------------------------------------------------------------
% - move/3 ----------------------------------------------------------------------
position(robot(R),C,T) :- move(robot(R),D,T), position(robot(R),C',T-1), nextto(C',D,C).
:- move(robot(R),D,T), position(robot(R),C,T-1), not nextto(C,D,_).

% - inertia ---------------------------------------------------------------------
position(robot(R),C,T) :- position(robot(R),C,T-1), not move(robot(R),_,T), isRobot(R), time(T).

% - edge collision --------------------------------------------------------------
moveto(C',C,T) :- nextto(C',D,C), position(robot(R),C',T-1), move(robot(R),D,T).
:- moveto(C',C,T), moveto(C,C',T), C < C'.

% - vertex collision ------------------------------------------------------------
:- { position(robot(R),C,T) : isRobot(R) }  > 1, position(C), time(T).
%--------------------------------------------------------------------------------

% set checkpoint
checkpoint(C,R') :- collision(C,_,_,R',_).
:- checkpoint(C,R'), not position(robot(R'),C,_).


% restriction to robot movement and positioning
:- move(robot(R),D,T), move(robot(R),D',T), D!=D'. 
:- position(robot(R),C,_), isRobot(R), not position(C).
:- position(robot(R),C,T), position(robot(R'),C,T), R!=R'.


% calculate and minimize steps
steps(S) :- position(robot(R'),C,T), collision(C,T',R,R',_), S=T-T'.
#minimize {(S): steps(S)}.

% adopt plan after reaching checkpoint
%switching
move(robot(R'),D,T+S-1) :- move_im(robot(R'),D,T), collision(_,T',_,R',2), steps(S), T>T'+1.
%colliding
move(robot(R'),D,T+S) :- move_im(robot(R'),D,T), collision(_,T',_,R',1), steps(S), T>T'.




%resolved((X,Y),T,R,R') :- collision((X,Y),T,R,R'), position(robot(R),(X,Y),T), position(robot(R'),(X,Y),T'), T'>T.
%resolved((X,Y),T,R,R') :- collision((X,Y),T,R,R'), move(robot(R),_,T'), move(robot(R'),_,T'), T'>T.
%:- collision((X,Y),T,R,R'), not resolved((X,Y),T,R,R').




#show.
#show occurs(object(robot,R), action(move,D),     T) :    move(robot(R),D,T).




%#show first_collision/1.
%#show collision/5.
%#show direction/1.
%#show checkpoint/2.
%#show position/1.
%#show position/3.
%#show steps/1.
%#show move/3.
%#show time/1.
