#show.
%#show nextto/3.
%#show robot/1.
%#show range/2.
%#show isRobot/1.
%#show direction/1.
%#show position_im(robot(R),(X,Y),T) : position(robot(R),(X,Y),T).
%#show position/1.
%#show move_im(robot(R),D,T) : move(robot(R),D,T).
#show occurs(object(robot,R), action(move,D),     T) :    move(robot(R),D,T).
