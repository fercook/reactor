// Gmsh project created on Thu Feb  7 08:09:14 2013
Point(1) = {0, 0, 0, 1.0};
Point(2) = {1, 0, 0, 1.0};
Point(3) = {1, 1, 0, 1.0};
Point(4) = {0, 1, 0, 1.0};
Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 4};
Line(4) = {4, 1};
Line Loop(5) = {2, 3, 4, 1};
Plane Surface(6) = {5};
Extrude {0, 0, 2} {
  Surface{6};
}
Physical Surface("Caras") = {28, 23, 27, 15, 19, 6};
Physical Volume("Volume") = {1};