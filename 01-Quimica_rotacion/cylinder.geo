// Gmsh project created on Mon Oct  1 08:41:14 2012
Point(1) = {0, 0, 0, 1.0};
Point(2) = {0.1, 0, 0, 1.0};
Point(3) = {0, 0.1, 0, 1.0};
Point(4) = {0, -0.1, 0, 1.0};
Point(5) = {-0.1, 0.0, 0, 1.0};
Circle(1) = {3, 1, 2};
Circle(2) = {2, 1, 4};
Circle(3) = {4, 1, 5};
Circle(4) = {5, 1, 3};
Line Loop(5) = {1, 2, 3, 4};
Plane Surface(6) = {5};
Extrude {0, 0, 0.2} {
  Line{2, 3, 4, 1};
}
Line Loop(23) = {7, 11, 15, 19};
Plane Surface(24) = {23};
Surface Loop(25) = {24, 10, 6, 22, 18, 14};
Volume(26) = {25};
Physical Surface("Base") = {6};
Physical Surface("Walls") = {18, 14, 10, 22};
Physical Surface("Top") = {24};
Physical Volume("Bulk") = {26};
