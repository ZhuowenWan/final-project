L = 1.0; 
H = 0.5;
R = 0.1;
lc = 0.05;

Point(1) = {0, 0, 0, lc};
Point(2) = {L, 0, 0, lc};
Point(3) = {L, H, 0, lc};
Point(4) = {0, H, 0, lc};

Point(5) = {0.5*L, 0.5*H, 0, lc};
Point(6) = {0.5*L + R, 0.5*H, 0, lc/2};
Point(7) = {0.5*L, 0.5*H + R, 0, lc/2};
Point(8) = {0.5*L - R, 0.5*H, 0, lc/2};
Point(9) = {0.5*L, 0.5*H - R, 0, lc/2};

Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 4};
Line(4) = {4, 1};

Circle(5) = {6, 5, 7};
Circle(6) = {7, 5, 8};
Circle(7) = {8, 5, 9};
Circle(8) = {9, 5, 6};

Curve Loop(1) = {1, 2, 3, 4};
Curve Loop(2) = {5, 6, 7, 8};

Plane Surface(1) = {1, 2};

Physical Curve("left") = {4};
Physical Curve("right") = {2};

Physical Curve("top") = {3};
Physical Curve("bottom") = {1};

Physical Curve("hole") = {5,6,7,8};

Physical Surface("domain") = {1};

Mesh 2;
Save "plate_with_hole.msh";