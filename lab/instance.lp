%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Grid size X: 3
%Grid size Y: 6
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#program base.

%init
init(object(node, 2), value(at, (2, 1))).
init(object(node, 5), value(at, (2, 2))).
init(object(node, 8), value(at, (2, 3))).
init(object(node, 11), value(at, (2, 4))).
init(object(node, 14), value(at, (2, 5))).
init(object(node, 17), value(at, (2, 6))).
init(object(node, 9), value(at, (3, 3))).
init(object(node, 12), value(at, (3, 4))).
init(object(node, 7), value(at, (1, 3))).
init(object(node, 10), value(at, (1, 4))).
init(object(node, 16), value(at, (1, 6))).
init(object(highway, 2), value(at, (2, 1))).
init(object(highway, 5), value(at, (2, 2))).
init(object(highway, 9), value(at, (3, 3))).
init(object(highway, 8), value(at, (2, 3))).
init(object(highway, 7), value(at, (1, 3))).
init(object(highway, 10), value(at, (1, 4))).
init(object(highway, 16), value(at, (1, 6))).
init(object(highway, 17), value(at, (2, 6))).
init(object(highway, 14), value(at, (2, 5))).
init(object(highway, 11), value(at, (2, 4))).
init(object(highway, 12), value(at, (3, 4))).
init(object(robot,1), value(at,(2,2))).
init(object(robot,1), value(max_energy,0)).
init(object(robot,1), value(energy,0)).
init(object(robot,2), value(at,(2,5))).
init(object(robot,2), value(max_energy,0)).
init(object(robot,2), value(energy,0)).
init(object(shelf,1), value(at,(2,6))).
init(object(product,1),value(on,(1,1))).
init(object(shelf,2), value(at,(2,1))).
init(object(product,2),value(on,(2,2))).
init(object(pickingStation,1), value(at,(1,6))).
init(object(order,1),value(pickingStation,1)).
init(object(order,1),value(line,(1,1))).
init(object(order,2),value(pickingStation,1)).
init(object(order,2),value(line,(2,2))).
