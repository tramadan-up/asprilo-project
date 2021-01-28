% detect collisions
collision((X,Y),T,R,R') :- position_(robot(R),(X,Y),T), position_(robot(R'),(X,Y),T), R!=R'.

collision((X,Y),T,R,R') :- position_(robot(R),(X,Y),T), position_(robot(R'),(X+1,Y),T), position_(robot(R),(X+1,Y),T+1), position_(robot(R'),(X,Y),T+1), R!=R'.

collision((X,Y),T,R,R') :- position_(robot(R),(X,Y),T), position_(robot(R'),(X-1,Y),T), position_(robot(R),(X-1,Y),T+1), position_(robot(R'),(X,Y),T+1), R!=R'.

collision((X,Y),T,R,R') :- position_(robot(R),(X,Y),T), position_(robot(R'),(X,Y+1),T), position_(robot(R),(X,Y+1),T+1), position_(robot(R'),(X,Y),T+1), R!=R'.

collision((X,Y),T,R,R') :- position_(robot(R),(X,Y),T), position_(robot(R'),(X,Y-1),T), position_(robot(R),(X,Y-1),T+1), position_(robot(R'),(X,Y),T+1), R!=R'.


% extract first collison
1{first_collision(T): collision((_,_),T,_,_), collision((_,_),T',_,_), T<=T'}1 :- collision((_,_),_,_,_).
:- first_collision(T), collision((_,_),T,_,_), collision((_,_),T',_,_), T>T'.

% robot R is the dominant robot
current_collision((X,Y),T,R,R') :- collision((X,Y),T,R,R'), first_collision(T), not current_collision((_,_),T,R',R).


% robots 'naturally' switching places
switching_places(T,R,R',1) :- current_collision((X,Y),T,R,R'), position_(robot(R),(X,Y),T), position_(robot(R'),(X+1,Y),T), position_(robot(R),(X+1,Y),T+1), position_(robot(R'),(X,Y),T+1), R!=R'.

switching_places(T,R,R',2) :- current_collision((X,Y),T,R,R'), position_(robot(R),(X,Y),T), position_(robot(R'),(X-1,Y),T), position_(robot(R),(X-1,Y),T+1), position_(robot(R'),(X,Y),T+1), R!=R'.

switching_places(T,R,R',3) :- current_collision((X,Y),T,R,R'), position_(robot(R),(X,Y),T), position_(robot(R'),(X,Y+1),T), position_(robot(R),(X,Y+1),T+1), position_(robot(R'),(X,Y),T+1), R!=R'.

switching_places(T,R,R',4) :- current_collision((X,Y),T,R,R'), position_(robot(R),(X,Y),T), position_(robot(R'),(X,Y-1),T), position_(robot(R),(X,Y-1),T+1), position_(robot(R'),(X,Y),T+1), R!=R'.
