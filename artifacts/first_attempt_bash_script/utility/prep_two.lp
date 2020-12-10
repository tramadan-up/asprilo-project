% simple program for renaming atoms to their initial name.
init(object(highway,H),value(at,(X,Y)))			:- init_(object(highway,H),value(at,(X,Y))).
init(object(node,N),value(at,(X,Y)))			:- init_(object(node,N),value(at,(X,Y))).
init(object(pickingStation,P),value(at,(X,Y)))	:- init_(object(pickingStation,P),value(at,(X,Y))).
init(object(product,P),value(on,(S,A)))			:- init_(object(product,P),value(on,(S,A))).
init(object(shelf,S),value(at,(X,Y)))			:- init_(object(shelf,S),value(at,(X,Y))).
init(object(robot,R),value(at,(X,Y)))			:- init_(object(robot,R),value(at,(X,Y))).
init(object(order,O),value(line,(X,Y)))			:- init_(object(order,O),value(line,(X,Y))).
init(object(order,O),value(pickingStation,P))	:- init_(object(order,O),value(pickingStation,P)).
#show.
#show init/2.
