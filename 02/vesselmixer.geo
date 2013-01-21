// Gmsh project created on Fri Nov 16 16:28:03 2012
cm=0.01;

VesselRad = 5*cm;
VesselHeight= 10*cm;


DiskRad= 1.7*cm;
DiskHeight= 2*cm;
DiskWidth= 0.3*cm;
DiskBase = DiskHeight-DiskWidth/2;
DiskTop  = DiskHeight+DiskWidth/2;

PropellerThickness= 0.3*cm;
PropellerPos= 1.5*cm;
PropellerWidth= 2*cm;
PropellerEnd=PropellerPos+PropellerWidth;
PropellerHeight= 1.5*cm;
PropellerBase=DiskHeight-PropellerHeight/2;
PropellerTop =DiskHeight+PropellerHeight/2;

AxisRad= 0.5*cm;
AxisHeight= DiskTop;
AxisLength= VesselHeight-DiskTop;

ResAtBounds=1.0;
ResAtMixer=0.25;

//Vessel
Point(1) = {0, 0, 0, ResAtBounds};
Point(2) = {VesselRad, 0, 0, ResAtBounds};
Point(3) = {0, VesselRad, 0, ResAtBounds};
Point(4) = {0, -VesselRad, 0, ResAtBounds};
Point(5) = {-VesselRad, 0, 0, ResAtBounds};
Circle(1) = {3, 1, 2};
Circle(2) = {2, 1, 4};
Circle(3) = {4, 1, 5};
Circle(4) = {5, 1, 3};
Extrude {0, 0, VesselHeight} {
  Line{1, 2, 3, 4};
}
//Axis
Point(100) = {0,        0,       AxisHeight, ResAtMixer};
Point(200) = {AxisRad,  0,       AxisHeight, ResAtMixer};
Point(300) = {0,        AxisRad, AxisHeight, ResAtMixer};
Point(400) = {0,       -AxisRad, AxisHeight, ResAtMixer};
Point(500) = {-AxisRad, 0,       AxisHeight, ResAtMixer};
Circle(100) = {300, 100, 200};
Circle(200) = {200, 100, 400};
Circle(300) = {400, 100, 500};
Circle(400) = {500, 100, 300};
Extrude {0, 0, AxisLength } {
  Line{100, 200, 300, 400};
}
//Bottom cap
Line Loop(417) = {3, 4, 1, 2};
Plane Surface(418) = {417};
//Top cap
Line Loop(419) = {13, 17, 5, 9};
Line Loop(420) = {405, 409, 413, 401};
Plane Surface(421) = {419, 420};


//Disk
Point(10) = {0, 0, DiskTop, ResAtMixer};
Point(21) = {Sqrt(DiskRad*DiskRad-(PropellerThickness/2)*(PropellerThickness/2)), -PropellerThickness/2, DiskTop, ResAtMixer};
Point(24) = {Sqrt(DiskRad*DiskRad-(PropellerThickness/2)*(PropellerThickness/2)),  PropellerThickness/2, DiskTop, ResAtMixer};

Point(31) = {PropellerThickness/2, Sqrt(DiskRad*DiskRad-(PropellerThickness/2)*(PropellerThickness/2)),  DiskTop, ResAtMixer};
Point(34) = {-PropellerThickness/2, Sqrt(DiskRad*DiskRad-(PropellerThickness/2)*(PropellerThickness/2)), DiskTop, ResAtMixer};

Point(41) = {-Sqrt(DiskRad*DiskRad-(PropellerThickness/2)*(PropellerThickness/2)), PropellerThickness/2, DiskTop, ResAtMixer};
Point(44) = {-Sqrt(DiskRad*DiskRad-(PropellerThickness/2)*(PropellerThickness/2)), -PropellerThickness/2, DiskTop, ResAtMixer};

Point(51) = {-PropellerThickness/2, -Sqrt(DiskRad*DiskRad-(PropellerThickness/2)*(PropellerThickness/2)), DiskTop, ResAtMixer};
Point(54) = {PropellerThickness/2, -Sqrt(DiskRad*DiskRad-(PropellerThickness/2)*(PropellerThickness/2)),  DiskTop, ResAtMixer};

Circle(10) = {24, 10, 31};
Circle(20) = {34, 10, 41};
Circle(30) = {44, 10, 51};
Circle(40) = {54, 10, 21};
Extrude {0, 0, -DiskWidth} {
  Line{10, 20, 30, 40};
}


//Propeller 1
Point(1001) = {PropellerPos, PropellerThickness/2, PropellerBase, ResAtMixer};
Point(1002) = {PropellerPos, -PropellerThickness/2, PropellerBase, ResAtMixer};
Point(1003) = {PropellerEnd, -PropellerThickness/2, PropellerBase, ResAtMixer};
Point(1004) = {PropellerEnd, PropellerThickness/2, PropellerBase, ResAtMixer};
Point(1005) = {PropellerPos, PropellerThickness/2, PropellerTop, ResAtMixer};
Point(1006) = {PropellerPos, -PropellerThickness/2, PropellerTop, ResAtMixer};
Point(1007) = {PropellerEnd, -PropellerThickness/2, PropellerTop, ResAtMixer};
Point(1008) = {PropellerEnd, PropellerThickness/2, PropellerTop, ResAtMixer};
Point(1020) = {PropellerPos, -PropellerThickness/2, DiskTop, ResAtMixer};
Point(1021) = {PropellerPos, PropellerThickness/2 , DiskTop, ResAtMixer};
Point(1022) = {PropellerPos, -PropellerThickness/2, DiskBase, ResAtMixer};
Point(1023) = {PropellerPos, PropellerThickness/2 , DiskBase, ResAtMixer};

//Propeller 2
Point(2001) = {-PropellerPos, PropellerThickness/2, PropellerBase, ResAtMixer};
Point(2002) = {-PropellerPos, -PropellerThickness/2, PropellerBase, ResAtMixer};
Point(2003) = {-PropellerEnd, -PropellerThickness/2, PropellerBase, ResAtMixer};
Point(2004) = {-PropellerEnd, PropellerThickness/2, PropellerBase, ResAtMixer};
Point(2005) = {-PropellerPos, PropellerThickness/2, PropellerTop, ResAtMixer};
Point(2006) = {-PropellerPos, -PropellerThickness/2, PropellerTop, ResAtMixer};
Point(2007) = {-PropellerEnd, -PropellerThickness/2, PropellerTop, ResAtMixer};
Point(2008) = {-PropellerEnd, PropellerThickness/2, PropellerTop, ResAtMixer};
Point(2020) = {-PropellerPos, PropellerThickness/2, DiskTop, ResAtMixer};
Point(2021) = {-PropellerPos, -PropellerThickness/2 , DiskTop, ResAtMixer};
Point(2022) = {-PropellerPos, PropellerThickness/2, DiskBase, ResAtMixer};
Point(2023) = {-PropellerPos, -PropellerThickness/2 , DiskBase, ResAtMixer};

//Propeller 3
Point(3001) = {PropellerThickness/2,  PropellerPos, PropellerBase, ResAtMixer};
Point(3002) = {-PropellerThickness/2, PropellerPos, PropellerBase, ResAtMixer};
Point(3003) = {-PropellerThickness/2, PropellerEnd, PropellerBase, ResAtMixer};
Point(3004) = {PropellerThickness/2,  PropellerEnd, PropellerBase, ResAtMixer};
Point(3005) = {PropellerThickness/2,  PropellerPos, PropellerTop, ResAtMixer};
Point(3006) = {-PropellerThickness/2, PropellerPos, PropellerTop, ResAtMixer};
Point(3007) = {-PropellerThickness/2, PropellerEnd, PropellerTop, ResAtMixer};
Point(3008) = {PropellerThickness/2,  PropellerEnd, PropellerTop, ResAtMixer};
Point(3010) = { PropellerThickness/2, PropellerPos , DiskTop, ResAtMixer};
Point(3011) = {-PropellerThickness/2, PropellerPos , DiskTop, ResAtMixer};
Point(3012) = { PropellerThickness/2, PropellerPos , DiskBase, ResAtMixer};
Point(3013) = {-PropellerThickness/2, PropellerPos , DiskBase, ResAtMixer};

//Propeller 4
Point(4001) = {PropellerThickness/2,  -PropellerPos, PropellerBase, ResAtMixer};
Point(4002) = {-PropellerThickness/2, -PropellerPos, PropellerBase, ResAtMixer};
Point(4003) = {-PropellerThickness/2, -PropellerEnd, PropellerBase, ResAtMixer};
Point(4004) = {PropellerThickness/2,  -PropellerEnd, PropellerBase, ResAtMixer};
Point(4005) = {PropellerThickness/2,  -PropellerPos, PropellerTop, ResAtMixer};
Point(4006) = {-PropellerThickness/2, -PropellerPos, PropellerTop, ResAtMixer};
Point(4007) = {-PropellerThickness/2, -PropellerEnd, PropellerTop, ResAtMixer};
Point(4008) = {PropellerThickness/2,  -PropellerEnd, PropellerTop, ResAtMixer};
Point(4010) = {-PropellerThickness/2, -PropellerPos , DiskTop, ResAtMixer};
Point(4011) = {PropellerThickness/2, -PropellerPos , DiskTop, ResAtMixer};
Point(4012) = {-PropellerThickness/2, -PropellerPos , DiskBase, ResAtMixer};
Point(4013) = {PropellerThickness/2, -PropellerPos , DiskBase, ResAtMixer};

Line(438) = {1022, 1002};
Line(439) = {1002, 1003};
Line(440) = {1003, 1004};
Line(441) = {1004, 1001};
Line(442) = {1001, 1002};
Line(443) = {1004, 1008};
Line(444) = {1003, 1007};
Line(445) = {1007, 1008};
Line(446) = {1008, 1005};
Line(447) = {1005, 1006};
Line(448) = {1006, 1007};
Line(449) = {1006, 1020};
Line(450) = {1020, 1021};
Line(451) = {1021, 1005};
Line(452) = {1022, 1023};
Line(453) = {1023, 1001};
Line(454) = {1022, 521};
Line(456) = {24, 1021};
Line(457) = {1020, 21};
Line(458) = {1023, 510};
Line(459) = {44, 2021};
Line(460) = {2021, 2006};
Line(461) = {2006, 2007};
Line(462) = {2007, 2003};
Line(463) = {2003, 2002};
Line(464) = {2002, 2023};
Line(465) = {2023, 516};
Line(466) = {515, 2022};
Line(467) = {2022, 2001};
Line(468) = {2001, 2004};
Line(469) = {2004, 2008};
Line(470) = {2008, 2005};
Line(471) = {2005, 2006};
Line(472) = {2005, 2020};
Line(473) = {2020, 41};
Line(474) = {2007, 2008};
Line(476) = {2004, 2003};
Line(477) = {2002, 2001};
Line(478) = {513, 3013};
Line(479) = {3013, 3002};
Line(480) = {3002, 3003};
Line(481) = {3003, 3007};
Line(482) = {3007, 3006};
Line(483) = {3006, 3011};
Line(484) = {3011, 34};
Line(485) = {512, 3012};
Line(486) = {3012, 3001};
Line(487) = {3001, 3004};
Line(488) = {3004, 3008};
Line(489) = {3008, 3005};
Line(490) = {3005, 3010};
Line(491) = {3010, 31};
Line(492) = {3005, 3006};
Line(493) = {3008, 3007};
Line(494) = {3004, 3003};
Line(495) = {3001, 3002};
Line(496) = {3012, 3013};
Line(497) = {3010, 3011};
Line(498) = {2020, 2021};
Line(499) = {2022, 2023};
Line(500) = {518, 4012};
Line(501) = {4012, 4002};
Line(502) = {4002, 4003};
Line(503) = {4003, 4007};
Line(504) = {4007, 4006};
Line(505) = {4006, 4010};
Line(506) = {4010, 51};
Line(507) = {519, 4013};
Line(508) = {4013, 4001};
Line(509) = {4001, 4004};
Line(510) = {4004, 4008};
Line(511) = {4008, 4005};
Line(512) = {4005, 4011};
Line(513) = {4011, 54};
Line(514) = {4006, 4005};
Line(515) = {4007, 4008};
Line(516) = {4003, 4004};
Line(517) = {4002, 4001};
Line(518) = {4012, 4013};
Line(519) = {4010, 4011};

//Propeller Surfaces
Line Loop(526) = {504, 505, 506, 432, 500, 501, 502, 503};
Plane Surface(527) = {526};
Line Loop(528) = {515, -510, -516, 503};
Plane Surface(529) = {528};
Line Loop(530) = {516, -509, -517, 502};
Plane Surface(531) = {530};
Line Loop(532) = {501, 517, -508, -518};
Plane Surface(533) = {532};
Line Loop(534) = {505, 519, -512, -514};
Plane Surface(535) = {534};
Line Loop(536) = {504, 514, -511, -515};
Plane Surface(537) = {536};

Line Loop(539) = {461, 462, 463, 464, 465, -431, 459, 460};
Plane Surface(540) = {539};
Line Loop(541) = {470, 472, 473, 428, 466, 467, 468, 469};
Plane Surface(542) = {541};
Line Loop(543) = {470, 471, 461, 474};
Plane Surface(544) = {543};
Line Loop(545) = {474, -469, 476, -462};
Plane Surface(546) = {545};
Line Loop(547) = {468, 476, 463, 477};
Plane Surface(548) = {547};
Line Loop(549) = {467, -477, 464, -499};
Plane Surface(550) = {549};
Line Loop(551) = {498, 460, -471, 472};
Plane Surface(552) = {551};


Line Loop(554) = {492, -482, -493, 489};
Plane Surface(555) = {554};
Line Loop(556) = {488, 493, -481, -494};
Plane Surface(557) = {556};
Line Loop(558) = {487, 494, -480, -495};
Plane Surface(559) = {558};
Line Loop(560) = {486, 495, -479, -496};
Plane Surface(561) = {560};
Line Loop(562) = {483, -497, -490, 492};
Plane Surface(563) = {562};
Line Loop(564) = {483, 484, 427, 478, 479, 480, 481, 482};
Plane Surface(565) = {564};
Line Loop(566) = {489, 490, 491, 424, 485, 486, 487, 488};
Plane Surface(567) = {566};


Line Loop(569) = {447, 449, 450, 451};
Plane Surface(570) = {569};
Line Loop(571) = {452, 453, 442, -438};
Plane Surface(572) = {571};
Line Loop(573) = {446, -451, -456, 423, -458, 453, -441, 443};
Plane Surface(574) = {573};
Line Loop(575) = {439, 440, 441, 442};
Plane Surface(576) = {575};
Line Loop(577) = {439, 444, -448, 449, 457, 436, -454, 438};
Plane Surface(578) = {577};
Line Loop(579) = {447, 448, 445, 446};
Plane Surface(580) = {579};
Line Loop(581) = {444, 445, -443, -440};
Plane Surface(582) = {581};
Line Loop(583) = {30, -506, 519, 513, 40, -457, 450, -456, 10, -491, 497, 484, 20, -473, 498, -459};
Line Loop(584) = {300, 400, 100, 200};
Plane Surface(585) = {583, 584};
Line Loop(586) = {430, 500, 518, -507, 434, -454, 452, 458, 422, 485, 496, -478, 426, 466, 499, 465};
Plane Surface(587) = {586};
Line Loop(589) = {511, 512, 513, 435, 507, 508, 509, 510};
Plane Surface(590) = {589};



Surface Loop(591) = {418, 16, 20, 8, 12, 421, 578, 576, 582, 580, 570, 585, 433, 527, 537, 535, 590, 437, 587, 533, 531, 529, 572, 574, 425, 567, 555, 563, 565, 429, 542, 544, 552, 540, 546, 548, 550, 561, 559, 557, 408, 412, 416, 404};
Volume(592) = {591};
lc = 0.1;

Physical Surface("VesselTop") = {421};
Physical Surface("VesselBottom") = {418};
Physical Surface("VesselSides") = {16, 20, 8, 12};
Physical Surface("Mixer") = {525, 527, 529, 537, 535, 533, 531,544, 546, 542, 540, 548, 550, 552, 555, 563, 561, 559, 567, 557, 565,580, 570, 572, 576, 574, 578, 582,425, 429, 437, 433,585,587,590};
Physical Surface("Stick") = {408, 416, 412, 404};
Physical Volume("Bulk") = {592};

