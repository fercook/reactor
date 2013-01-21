Rc=0.00025;
L=0.001;
cm=0.1;

// Gmsh project created on Mon Jan 21 12:08:50 2013
Point(1) = {0, 0, 0, 1.0};
Point(2) = {L, 0, 0, 1.0};
Point(3) = {L, L, 0, 1.0};
Point(4) = {0., L, 0, 1.0};
Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 4};
Line(4) = {4, 1};
Line Loop(5) = {2, 3, 4, 1};
Plane Surface(6) = {5};
Extrude {0, 0, L} {
  Surface{6};
}
Physical Surface("Walls") = {28, 23, 19, 6, 15, 27};
Point(15) = {L/2, L/2, L/2, 1.0};
Point(16) = {L/2+Rc, L/2, L/2, cm};
Point(17) = {L/2, L/2+Rc, L/2, cm};
Point(18) = {L/2-Rc, L/2, L/2, cm};
Point(19) = {L/2, L/2-Rc, L/2, cm};

Circle(29) = {18, 15, 17};
Circle(30) = {17, 15, 16};
Circle(31) = {16, 15, 19};
Circle(32) = {19, 15, 18};
Extrude {{0, 1, 0}, {0.0005, 0.0005, 0.0005}, Pi/2} {
  Line{30, 31, 32, 29};
}
Extrude {{0, 1, 0}, {0.0005, 0.0005, 0.0005}, Pi/2} {
  Line{33, 36, 42, 39};
}
Delete {
  Volume{1};
}
Surface Loop(57) = {53, 35, 38, 50, 41, 44, 47, 56};
Volume(58) = {57};
Surface Loop(59) = {19, 6, 15, 28, 23, 27};
Volume(60) = {57, 59};
Physical Volume("Bulk1") = {58};
Physical Volume("bulk2") = {60};

