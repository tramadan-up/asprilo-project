% some text
#include "./collision_detection.lp".
#include "./collision_classification.lp".
#include "./resolution/horizontal_collision_left.lp".
#include "./resolution/horizontal_collision_right.lp".
#include "./resolution/vertical_collision_top.lp".
#include "./resolution/vertical_collision_bottom.lp".

% adopt plans until current collision
occurs(object(robot,R),action(move,(U,V)),T) :- occurs_(object(robot,R),action(move,(U,V)),T), current_collision((_,_),T',R,R'), T<T'.
occurs(object(robot,R'),action(move,(U,V)),T) :- occurs_(object(robot,R'),action(move,(U,V)),T), current_collision((_,_),T',R,R'), T<T'.

% adopt plans after collision
occurs(object(robot,R'),action(move,(U,V)),T+1) :- occurs_(object(robot,R'),action(move,(U,V)),T), solvable_collision((X,Y),T',_), collision_class((X,Y),T',R,R',_), T>=T'.
occurs(object(robot,R),action(move,(U,V)),T+2) :- occurs_(object(robot,R),action(move,(U,V)),T), solvable_collision((X,Y),T',_), collision_class((X,Y),T',R,R',_), T>T'.

%:- { occurs(object(robot,R),action(move,(_,_)),T) } != 1, isRobot(R), time(T).


#show.
#show collision_pattern/3.
#show collision_class/5.
#show current_collision/4.
#show solvable_collision/3.
#show occurs/3.
