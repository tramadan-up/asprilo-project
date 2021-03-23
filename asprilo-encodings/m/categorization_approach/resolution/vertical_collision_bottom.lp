% horizontal collision, collision is on the bottom
% is the problem solvable? (is there a gap to the right/left?)
solvable_collision((X,Y),T,1) :- collision_class((X,Y),T,R,R',4), position((X-1,Y)), not solvable_collision((X,Y),T,2).
solvable_collision((X,Y),T,2) :- collision_class((X,Y),T,R,R',4), position((X+1,Y)), not solvable_collision((X,Y),T,1).


% gap is to the left
% resolving conflict
occurs(object(robot,R),action(move,(-1,0)),T+1) :- solvable_collision((X,Y),T,1), collision_class((X,Y),T,R,R',4).
occurs(object(robot,R'),action(move,(0,1)),T+1) :- solvable_collision((X,Y),T,1), collision_class((X,Y),T,R,R',4).
occurs(object(robot,R),action(move,(1,0)),T+2) :- solvable_collision((X,Y),T,1), collision_class((X,Y),T,R,R',4).


% gap is to the right
% resolving conflict
occurs(object(robot,R),action(move,(1,0)),T+1) :- solvable_collision((X,Y),T,2), collision_class((X,Y),T,R,R',4).
occurs(object(robot,R'),action(move,(0,1)),T+1) :- solvable_collision((X,Y),T,2), collision_class((X,Y),T,R,R',4).
occurs(object(robot,R),action(move,(-1,0)),T+2) :- solvable_collision((X,Y),T,2), collision_class((X,Y),T,R,R',4).
