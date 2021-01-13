% horizontal collision, collision is on the left
% is the problem solvable? (is there a gap to the top/bottom?)
solvable_collision((X,Y),T,1) :- collision_class((X,Y),T,R,R',1), position((X,Y-1)), not solvable_collision((X,Y),T,2).
solvable_collision((X,Y),T,2) :- collision_class((X,Y),T,R,R',1), position((X,Y+1)), not solvable_collision((X,Y),T,1).


% gap is to the top
% resolving conflict
occurs(object(robot,R),action(move,(0,-1)),T+1) :- solvable_collision((X,Y),T,1), collision_class((X,Y),T,R,R',1).
occurs(object(robot,R'),action(move,(-1,0)),T+1) :- solvable_collision((X,Y),T,1), collision_class((X,Y),T,R,R',1).
occurs(object(robot,R),action(move,(0,1)),T+2) :- solvable_collision((X,Y),T,1), collision_class((X,Y),T,R,R',1).
% adopt plan after collision
%occurs(object(robot,R'),action(move,(U,V)),T+1) :- occurs_(object(robot,R'),action(move,(U,V)),T), solvable_collision((X,Y),T',1), collision_class((X,Y),T',R,R',1), T>=T'.
%occurs(object(robot,R),action(move,(U,V)),T+2) :- occurs_(object(robot,R),action(move,(U,V)),T), solvable_collision((X,Y),T',1), collision_class((X,Y),T',R,R',1), T>=T'.

% gap is to the bottom
% resolving conflict
occurs(object(robot,R),action(move,(0,1)),T+1) :- solvable_collision((X,Y),T,2), collision_class((X,Y),T,R,R',1).
occurs(object(robot,R'),action(move,(-1,0)),T+1) :- solvable_collision((X,Y),T,2), collision_class((X,Y),T,R,R',1).
occurs(object(robot,R),action(move,(0,-1)),T+2) :- solvable_collision((X,Y),T,2), collision_class((X,Y),T,R,R',1).
% adopt plan after collision
%occurs(object(robot,R'),action(move,(U,V)),T+1) :- occurs_(object(robot,R'),action(move,(U,V)),T), solvable_collision((X,Y),T',2), collision_class((X,Y),T',R,R',1), T>=T'.
%occurs(object(robot,R),action(move,(U,V)),T+2) :- occurs_(object(robot,R),action(move,(U,V)),T), solvable_collision((X,Y),T',2), collision_class((X,Y),T',R,R',1), T>=T'.
