% classification of collision
% there are four classes of collisions after litte adjustments (movement of one robot towards the collision while the other waits). the dominant robot sits on the collision node after the movement.


% there are two patterns of collisions between two robots (excluding robots wanting to change places)
% all 12 variatons (each of both robots can be the dominant one) of those patterns are categorized in the following
% catergory 1: dominant robot moves right
collision_pattern((X,Y),T,1) :- current_collision((X,Y),T,R,R'), position_(robot(R),(X-1,Y),T-1), position_(robot(R'),(X+1,Y),T-1), R!=R'.
collision_pattern((X,Y),T,1) :- current_collision((X,Y),T,R,R'), position_(robot(R),(X-1,Y),T-1), position_(robot(R'),(X,Y-1),T-1), R!=R'.
collision_pattern((X,Y),T,1) :- current_collision((X,Y),T,R,R'), position_(robot(R),(X-1,Y),T-1), position_(robot(R'),(X,Y+1),T-1), R!=R'.

% catergory 2: dominant robot moves left
collision_pattern((X,Y),T,2) :- current_collision((X,Y),T,R,R'), position_(robot(R),(X+1,Y),T-1), position_(robot(R'),(X-1,Y),T-1), R!=R'.
collision_pattern((X,Y),T,2) :- current_collision((X,Y),T,R,R'), position_(robot(R),(X+1,Y),T-1), position_(robot(R'),(X,Y-1),T-1), R!=R'.
collision_pattern((X,Y),T,2) :- current_collision((X,Y),T,R,R'), position_(robot(R),(X+1,Y),T-1), position_(robot(R'),(X,Y+1),T-1), R!=R'.

% catergory 3: dominant robot moves up
collision_pattern((X,Y),T,3) :- current_collision((X,Y),T,R,R'), position_(robot(R),(X,Y+1),T-1), position_(robot(R'),(X,Y-1),T-1), R!=R'.
collision_pattern((X,Y),T,3) :- current_collision((X,Y),T,R,R'), position_(robot(R),(X,Y+1),T-1), position_(robot(R'),(X-1,Y),T-1), R!=R'.
collision_pattern((X,Y),T,3) :- current_collision((X,Y),T,R,R'), position_(robot(R),(X,Y+1),T-1), position_(robot(R'),(X+1,Y),T-1), R!=R'.

% catergory 4: dominant robot moves down
collision_pattern((X,Y),T,4) :- current_collision((X,Y),T,R,R'), position_(robot(R),(X,Y-1),T-1), position_(robot(R'),(X,Y+1),T-1), R!=R'.
collision_pattern((X,Y),T,4) :- current_collision((X,Y),T,R,R'), position_(robot(R),(X,Y-1),T-1), position_(robot(R'),(X-1,Y),T-1), R!=R'.
collision_pattern((X,Y),T,4) :- current_collision((X,Y),T,R,R'), position_(robot(R),(X,Y-1),T-1), position_(robot(R'),(X+1,Y),T-1), R!=R'.

% robot movement
% dominant robot moves right
occurs(object(robot,R),action(move,(1,0)),T) :- collision_pattern((X,Y),T,C), current_collision((X,Y),T,R,_), position_(robot(R),(X-1,Y),T-1), position_(robot(R),(X,Y),T), C==1.

% dominant robot moves left
occurs(object(robot,R),action(move,(-1,0)),T) :- collision_pattern((X,Y),T,C), current_collision((X,Y),T,R,_), position_(robot(R),(X+1,Y),T-1), position_(robot(R),(X,Y),T), C==2.

% dominant robot moves up
occurs(object(robot,R),action(move,(0,-1)),T) :- collision_pattern((X,Y),T,C), current_collision((X,Y),T,R,_), position_(robot(R),(X,Y+1),T-1), position_(robot(R),(X,Y),T), C==3.

% dominant robot moves down
occurs(object(robot,R),action(move,(0,1)),T) :- collision_pattern((X,Y),T,C), current_collision((X,Y),T,R,_), position_(robot(R),(X,Y-1),T-1), position_(robot(R),(X,Y),T), C==4.



% class 1: robot 1 and 2 form a horizontal line, collision is left
collision_class((X,Y),T,R,R',1) :- collision_pattern((X,Y),T,_), current_collision((X,Y),T,R,R'), position_(robot(R'),(X+1,Y),T-1), occurs(object(robot,R),action(move,(_,_)),T), R!=R'.

collision_class((X,Y),T,R,R',1) :- switching_places(T,R,R',1), current_collision((X,Y),T,R,R').

% class 2: robot 1 and 2 form a horizontal line, collision is right
collision_class((X,Y),T,R,R',2) :- collision_pattern((X,Y),T,_), current_collision((X,Y),T,R,R'), position_(robot(R'),(X-1,Y),T-1), occurs(object(robot,R),action(move,(_,_)),T), R!=R'.

collision_class((X,Y),T,R,R',2) :- switching_places(T,R,R',2), current_collision((X,Y),T,R,R').

% class 3: robot 1 and 2 form a vertical line, collision is top
collision_class((X,Y),T,R,R',3) :- collision_pattern((X,Y),T,_), current_collision((X,Y),T,R,R'), position_(robot(R'),(X,Y+1),T-1), occurs(object(robot,R),action(move,(_,_)),T), R!=R'.

collision_class((X,Y),T,R,R',3) :- switching_places(T,R,R',3), current_collision((X,Y),T,R,R').

% class 4: robot 1 and 2 form a vertical line, collision is bottom
collision_class((X,Y),T,R,R',4) :- collision_pattern((X,Y),T,_), current_collision((X,Y),T,R,R'), position_(robot(R'),(X,Y-1),T-1), occurs(object(robot,R),action(move,(_,_)),T), R!=R'.

collision_class((X,Y),T,R,R',4) :- switching_places(T,R,R',4), current_collision((X,Y),T,R,R').











