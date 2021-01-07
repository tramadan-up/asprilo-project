% right/left, collision is on the left
% is the problem solvable? (is there a gap?)
solvable((X,Y),T,1,1) :- switching_places((X,Y),T,R,R',1), position((X,Y-1)).
solvable((X,Y),T,1,2) :- switching_places((X,Y),T,R,R',1), position((X+1,Y-1)).
solvable((X,Y),T,1,3) :- switching_places((X,Y),T,R,R',1), position((X,Y+1)).
solvable((X,Y),T,1,4) :- switching_places((X,Y),T,R,R',1), position((X+1,Y+1)).

% first case (gap is up)
% resolve conflict
occurs(object(robot,R),action(move,(0,-1)),T+1) :- solvable((X,Y),T,1,1), switching_places((X,Y),T,R,R',1).
occurs(object(robot,R'),action(move,(-1,0)),T+1) :- solvable((X,Y),T,1,1), switching_places((X,Y),T,R,R',1).
occurs(object(robot,R),action(move,(0,1)),T+2) :- solvable((X,Y),T,1,1), switching_places((X,Y),T,R,R',1).
% adopt plan after collision
% without pooling
occurs(object(robot,R'),action(move,(U,V)),T+1) :- occ(object(robot,R'),action(move,(U,V)),T), solvable((X,Y),T',1,1), switching_places((X,Y),T',R,R',1), T>=T', not mpool((_,Y),(X,Y),1,_).
occurs(object(robot,R),action(move,(U,V)),T+2) :- occ(object(robot,R),action(move,(U,V)),T), solvable((X,Y),T',1,1), switching_places((X,Y),T',R,R',1), T>=T', not mpool((_,Y),(X,Y),1,_).
% with pooling
% one robot needs to move to the original collision
occurs(object(robot,R'),action(move,(-1,0)),(T'+2)..(T'+S+1)) :- switching_places((X,Y),T,R,R',1), mpool((X,Y),(X',Y),1,S), switching_places((X',Y),T',R,R',1), solvable((X',Y),T',1,1).
% adopt plans from fixpoints respectively
occurs(object(robot,R),action(move,(U,V)),T+2) :- occ(object(robot,R),action(move,(U,V)),T), solvable((X,Y),T',1,1), switching_places((X,Y),T',R,R',1), T>=T', mpool((_,Y),(X,Y),1,_).
occurs(object(robot,R'),action(move,(U,V)),T+1+(2*S)) :- occ(object(robot,R'),action(move,(U,V)),T), switching_places((X,Y),T',R,R',1), T>=T', mpool((X,Y),(_,Y),1,S).

% second case (gap is right/up)
%occurs(object(robot,R'),action(move,(0,-1)),T+1) :- solvable((X,Y),T,1,2), switching_places((X,Y),T,R,R',1).
%occurs(object(robot,R),action(move,(1,0)),T+1) :- solvable((X,Y),T,1,2), switching_places((X,Y),T,R,R',1).
%occurs(object(robot,R'),action(move,(0,1)),T+2) :- solvable((X,Y),T,1,2), switching_places((X,Y),T,R,R',1).
% adopt plan after collision
%occurs(object(robot,R),action(move,(U,V)),T+1) :- occ(object(robot,R),action(move,(U,V)),T), solvable((X,Y),T',1,2), switching_places((X,Y),T',R,R',1), T>=T', not mpool((_,Y),(X,Y),1,_).
%occurs(object(robot,R'),action(move,(U,V)),T+2) :- occ(object(robot,R'),action(move,(U,V)),T), solvable((X,Y),T',1,2), switching_places((X,Y),T',R,R',1), T>=T', not mpool((_,Y),(X,Y),1,_).

% third case (gap is down)
%occurs(object(robot,R),action(move,(0,1)),T+1) :- solvable((X,Y),T,1,3), switching_places((X,Y),T,R,R',1).
%occurs(object(robot,R'),action(move,(-1,0)),T+1) :- solvable((X,Y),T,1,3), switching_places((X,Y),T,R,R',1).
%occurs(object(robot,R),action(move,(0,-1)),T+2) :- solvable((X,Y),T,1,3), switching_places((X,Y),T,R,R',1).
% adopt plan after collision
%occurs(object(robot,R'),action(move,(U,V)),T+1) :- occ(object(robot,R'),action(move,(U,V)),T), solvable((X,Y),T',1,3), switching_places((X,Y),T',R,R',1), T>=T', not mpool((_,Y),(X,Y),1,_).
%occurs(object(robot,R),action(move,(U,V)),T+2) :- occ(object(robot,R),action(move,(U,V)),T), solvable((X,Y),T',1,3), switching_places((X,Y),T',R,R',1), T>=T', not mpool((_,Y),(X,Y),1,_).

% fourth case (gap is right/down)
%occurs(object(robot,R'),action(move,(0,1)),T+1) :- solvable((X,Y),T,1,4), switching_places((X,Y),T,R,R',1).
%occurs(object(robot,R),action(move,(1,0)),T+1) :- solvable((X,Y),T,1,4), switching_places((X,Y),T,R,R',1).
%occurs(object(robot,R'),action(move,(0,-1)),T+2) :- solvable((X,Y),T,1,4), switching_places((X,Y),T,R,R',1).
% adopt plan after collision
%occurs(object(robot,R),action(move,(U,V)),T+1) :- occ(object(robot,R),action(move,(U,V)),T), solvable((X,Y),T',1,4), switching_places((X,Y),T',R,R',1), T>=T', not mpool((_,Y),(X,Y),1,_).
%occurs(object(robot,R'),action(move,(U,V)),T+2) :- occ(object(robot,R'),action(move,(U,V)),T), solvable((X,Y),T',1,4), switching_places((X,Y),T',R,R',1), T>=T', not mpool((_,Y),(X,Y),1,_).
