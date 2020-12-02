% this simple program detects collision and returns prohibited positions for robot 2

- pos(robot(2),(X,Y),T) :- position(robot(2),(X,Y),T), position(robot(1),(X,Y),T).

#show.
#show - pos/3.
