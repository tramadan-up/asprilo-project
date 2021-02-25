%gap_detection.lp
% horizon=20
% horizon robot 1 = 6
% horizon robot 2 = 6



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Grid size X: 7
%Grid size Y: 5
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#program base.

%init
init(object(node, 1), value(at, (1, 1))).
init(object(node, 2), value(at, (2, 1))).
init(object(node, 3), value(at, (3, 1))).
init(object(node, 4), value(at, (4, 1))).
init(object(node, 5), value(at, (5, 1))).
init(object(node, 6), value(at, (6, 1))).
init(object(node, 27), value(at, (6, 4))).
init(object(node, 35), value(at, (7, 5))).
init(object(node, 28), value(at, (7, 4))).
init(object(node, 21), value(at, (7, 3))).
init(object(node, 7), value(at, (7, 1))).
init(object(node, 14), value(at, (7, 2))).
init(object(highway, 2), value(at, (2, 1))).
init(object(highway, 3), value(at, (3, 1))).
init(object(highway, 4), value(at, (4, 1))).
init(object(highway, 5), value(at, (5, 1))).
init(object(highway, 6), value(at, (6, 1))).
init(object(highway, 14), value(at, (7, 2))).
init(object(highway, 21), value(at, (7, 3))).
init(object(highway, 28), value(at, (7, 4))).
init(object(highway, 35), value(at, (7, 5))).
init(object(highway, 27), value(at, (6, 4))).
init(object(shelf,1), value(at,(1,1))).
init(object(shelf,2), value(at,(7,1))).
init(object(robot,1), value(at,(7,1))).
init(object(robot,1), value(max_energy,0)).
init(object(robot,1), value(energy,0)).
init(object(robot,2), value(at,(1,1))).
init(object(robot,2), value(max_energy,0)).
init(object(robot,2), value(energy,0)).
