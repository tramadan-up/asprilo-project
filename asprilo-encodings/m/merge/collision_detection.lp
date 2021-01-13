% detect collisions
collision((X,Y),T,R,R') :- position_(robot(R),(X,Y),T), position_(robot(R'),(X,Y),T), R!=R'.

% extract first collison
1{first_collision(T): collision((_,_),T,_,_), collision((_,_),T',_,_), T<=T'}1 :- collision((_,_),_,_,_).
:- first_collision(T), collision((_,_),T,_,_), collision((_,_),T',_,_), T>T'.

% robot R is the dominant robot
current_collision((X,Y),T,R,R') :- collision((X,Y),T,R,R'), first_collision(T), not current_collision((X,Y),T,R',R).

