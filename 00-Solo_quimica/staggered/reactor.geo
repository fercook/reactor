// Gmsh project created on Wed Oct  3 11:19:36 2012
Point(1) = {0, 0, 0, 1.0};
Point(2) = {0.1, 0, 0, 1.0};
Point(3) = {0.1, 0.1, 0, 1.0};
Point(4) = {0, 0.1, 0, 1.0};
Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 4};
Line(4) = {4, 1};
Line Loop(5) = {2, 3, 4, 1};
Plane Surface(6) = {5};
Physical Line("Walls") = {2, 4};
Physical Line("TopBottom") = {3, 1};
Physical Surface("Bulk") = {6};
