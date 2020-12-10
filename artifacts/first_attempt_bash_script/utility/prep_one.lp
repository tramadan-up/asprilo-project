% simple program for renaming atoms leaving unwanted ones out.

%#const rid=1.
%#const oid=1.
init_(object(highway,H),value(at,(X,Y)))			:- init(object(highway,H),value(at,(X,Y))).
init_(object(node,N),value(at,(X,Y)))				:- init(object(node,N),value(at,(X,Y))).
init_(object(pickingStation,P),value(at,(X,Y)))		:- init(object(pickingStation,P),value(at,(X,Y))).
init_(object(product,P),value(on,(S,A)))			:- init(object(product,P),value(on,(S,A))).
init_(object(shelf,S),value(at,(X,Y)))				:- init(object(shelf,S),value(at,(X,Y))).
init_(object(robot,R),value(at,(X,Y)))				:- init(object(robot,R),value(at,(X,Y))), R!=rid.
init_(object(order,O),value(line,(X,Y)))			:- init(object(order,O),value(line,(X,Y))), O!=oid.
init_(object(order,O),value(pickingStation,P))		:- init(object(order,O),value(pickingStation,P)), O!=oid.
#show.
#show init_/2.
