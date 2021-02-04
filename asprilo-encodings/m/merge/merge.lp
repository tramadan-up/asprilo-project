% some text
#include "./collision_detection.lp".
#include "./collision_classification.lp".
#include "./gap_detection.lp".
#include "./resolution/horizontal_collision_left.lp".
#include "./resolution/horizontal_collision_right.lp".
#include "./resolution/vertical_collision_top.lp".
#include "./resolution/vertical_collision_bottom.lp".

% adopt plans until current collision
occurs(object(robot,R),action(move,(U,V)),T) :- occurs_(object(robot,R),action(move,(U,V)),T), current_collision((_,_),T',R,R'), T<T', not switching_places(T',R,R',_).
occurs(object(robot,R'),action(move,(U,V)),T) :- occurs_(object(robot,R'),action(move,(U,V)),T), current_collision((_,_),T',R,R'), T<T', not switching_places(T',R,R',_).

% adopt plans after resolution of collision
% case 1: collision is resolved on the spot (not naturally switching places)
occurs(object(robot,R'),action(move,(U,V)),T+1) :- occurs_(object(robot,R'),action(move,(U,V)),T), solvable_collision((X,Y),T',_), collision_class((X,Y),T',R,R',_), T>=T', not switching_places(T',R,R',_), not gap((_,_),(_,_),_,_).
occurs(object(robot,R),action(move,(U,V)),T+2) :- occurs_(object(robot,R),action(move,(U,V)),T), solvable_collision((X,Y),T',_), collision_class((X,Y),T',R,R',_), T>T', not switching_places(T',R,R',_), not gap((_,_),(_,_),_,_).


% case 2: robots 'naturally' switching places
occurs(object(robot,R),action(move,(U,V)),T) :- occurs_(object(robot,R),action(move,(U,V)),T), current_collision((_,_),T',R,R'), T<=T', switching_places(T',R,R',_).
occurs(object(robot,R'),action(move,(U,V)),T) :- occurs_(object(robot,R'),action(move,(U,V)),T), current_collision((_,_),T',R,R'), T<=T', switching_places(T',R,R',_).

occurs(object(robot,R'),action(move,(U,V)),T) :- occurs_(object(robot,R'),action(move,(U,V)),T), solvable_collision((X,Y),T',_), collision_class((X,Y),T',R,R',_), T>T', switching_places(T',R,R',_).
occurs(object(robot,R),action(move,(U,V)),T+2) :- occurs_(object(robot,R),action(move,(U,V)),T), solvable_collision((X,Y),T',_), collision_class((X,Y),T',R,R',_), T>T', switching_places(T',R,R',_).


% case 3: after moving to a gap
occurs(object(robot,R),action(move,(U,V)),T+2) :- occurs_(object(robot,R),action(move,(U,V)),T), T>=T'+1, first_gap(T'), gap((X,Y),(X',Y'),T',S).

occurs(object(robot,R'),action(move,(U,V)),T+(2*S)+1) :- occurs_(object(robot,R'),action(move,(U,V)),T), T>=T', first_gap(T_), gap((X,Y),(X',Y'),T_,S), collision_class((X,Y),T',R,R',_).


%{ occurs(object(robot,R),action(move,D),T) : direction(D) } 1 :- isRobot(R), time(T).



#show.
#show occurs/3.

#show collision_pattern/3.
#show collision_class/5.
#show current_collision/4.
#show solvable_collision/3.
#show gap/4.
#show first_gap/1.
