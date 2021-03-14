%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Grid size X: 7
%Grid size Y: 3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#program base.

%init
init(object(node, 2), value(at, (2, 1))).
init(object(node, 9), value(at, (2, 2))).
init(object(node, 16), value(at, (2, 3))).
init(object(node, 3), value(at, (3, 1))).
init(object(node, 10), value(at, (3, 2))).
init(object(node, 17), value(at, (3, 3))).
init(object(node, 11), value(at, (4, 2))).
init(object(node, 5), value(at, (5, 1))).
init(object(node, 12), value(at, (5, 2))).
init(object(node, 19), value(at, (5, 3))).
init(object(node, 6), value(at, (6, 1))).
init(object(node, 13), value(at, (6, 2))).
init(object(node, 20), value(at, (6, 3))).
init(object(node, 7), value(at, (7, 1))).
init(object(node, 14), value(at, (7, 2))).
init(object(node, 21), value(at, (7, 3))).
init(object(node, 8), value(at, (1, 2))).
init(object(node, 15), value(at, (1, 3))).
init(object(node, 1), value(at, (1, 1))).
init(object(highway, 2), value(at, (2, 1))).
init(object(highway, 9), value(at, (2, 2))).
init(object(highway, 16), value(at, (2, 3))).
init(object(highway, 3), value(at, (3, 1))).
init(object(highway, 10), value(at, (3, 2))).
init(object(highway, 17), value(at, (3, 3))).
init(object(highway, 19), value(at, (5, 3))).
init(object(highway, 12), value(at, (5, 2))).
init(object(highway, 11), value(at, (4, 2))).
init(object(highway, 5), value(at, (5, 1))).
init(object(highway, 6), value(at, (6, 1))).
init(object(highway, 13), value(at, (6, 2))).
init(object(highway, 20), value(at, (6, 3))).
init(object(robot,1), value(at,(1,1))).
init(object(robot,1), value(max_energy,0)).
init(object(robot,1), value(energy,0)).
init(object(robot,2), value(at,(1,2))).
init(object(robot,2), value(max_energy,0)).
init(object(robot,2), value(energy,0)).
init(object(robot,3), value(at,(1,3))).
init(object(robot,3), value(max_energy,0)).
init(object(robot,3), value(energy,0)).
init(object(robot,4), value(at,(7,1))).
init(object(robot,4), value(max_energy,0)).
init(object(robot,4), value(energy,0)).
init(object(robot,5), value(at,(7,2))).
init(object(robot,5), value(max_energy,0)).
init(object(robot,5), value(energy,0)).
init(object(robot,6), value(at,(7,3))).
init(object(robot,6), value(max_energy,0)).
init(object(robot,6), value(energy,0)).
init(object(shelf,1), value(at,(7,1))).
init(object(product,1),value(on,(1,1))).
init(object(shelf,2), value(at,(7,2))).
init(object(product,2),value(on,(2,1))).
init(object(shelf,3), value(at,(7,3))).
init(object(product,3),value(on,(3,1))).
init(object(shelf,4), value(at,(1,1))).
init(object(product,4),value(on,(4,1))).
init(object(shelf,5), value(at,(1,2))).
init(object(product,5),value(on,(5,1))).
init(object(shelf,6), value(at,(1,3))).
init(object(product,6),value(on,(6,1))).
init(object(pickingStation,1), value(at,(3,3))).
init(object(order,1),value(pickingStation,1)).
init(object(order,1),value(line,(1,1))).
init(object(order,2),value(pickingStation,1)).
init(object(order,2),value(line,(2,1))).
init(object(order,3),value(pickingStation,1)).
init(object(order,3),value(line,(3,1))).
init(object(order,4),value(pickingStation,1)).
init(object(order,4),value(line,(4,1))).
init(object(order,5),value(pickingStation,1)).
init(object(order,5),value(line,(5,1))).
init(object(order,6),value(pickingStation,1)).
init(object(order,6),value(line,(6,1))).
