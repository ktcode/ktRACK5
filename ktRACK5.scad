//
// ktRACK5
//
//


gap1 = 0.001;
gap2 = 0.002;

panel_thick = 2;

BR = 27.6+1;
BR2 = 26.5;
BH = 8;
BHD = 1.8;
CR = 4.5;
CH = 60;
WW = 69;
SR = BH+panel_thick;
X = WW-SR;
Y = 45;
Z = 30;

A = 1;
B = 0;
C = 0;
D = 0;
E = 0;

if(E)
{
    futa();
}
if(D)
{
color("DarkGoldenrod", 1.0) {translate([0, 0, -100]) cube([WW, WW, 200]);}
}

if(A)
{
difference()
{
    union()
    {
        translate([WW/2-X/2, -Y, 0]) cube([X, Y, BH+panel_thick]);
        translate([SR/2, 0, SR/2]) rotate([90, 0, 0]) cylinder(Y, d=SR, $fn=100);
        translate([WW-SR/2, 0, SR/2]) rotate([90, 0, 0]) cylinder(Y, d=SR, $fn=100);
    }
    translate([WW/2, -Y/2, panel_thick+gap1+BHD+1]) cylinder(BH-BHD, d=BR2, $fn=100);
    translate([WW/2, -Y/2, panel_thick+gap1+BHD]) cylinder(BH-BHD-0.5, d=BR, $fn=100);
    translate([WW/2, -Y/2, panel_thick+gap1+BHD-0.5-10]) cylinder(BH-BHD+10, d=BR, $fn=100);
    
    translate([WW/2-51/2, -Y/2-11/2, -gap1]) cube([51, 11, panel_thick+BHD]);
    screw_hole( WW/2-50/2+6, -Y/2, panel_thick+BHD-gap1 );
    screw_hole( WW/2+50/2-6, -Y/2, panel_thick+BHD-gap1 );
    
    translate([WW/2, -Y/2, panel_thick+gap1]) cylinder(100, d=3, $fn=100);
    translate([WW/2-CR/2, -Y/2+1.15, -gap1]) rotate([0, 0, -60]) cube([CR, CH, BH+BHD/2]);
    translate([WW/2-CR/2, -Y/2+1.15, -gap1]) rotate([0, 0, -60]) cube([6+1, 14, BH]);
    
    translate([15, -4, 2.5]) rotate([-45, 0, 0]) cylinder(30, d1=4.5, d2=4.5, $fn=100);
    translate([15, -4, 2.5]) rotate([-45, 0, 0]) cylinder( panel_thick, d1=8, d2=4.5, $fn=100);
    translate([15, -4, 2.5]) rotate([-45, 0, 0]) rotate([0, 180, 0]) cylinder(30, d1=8, d2=8, $fn=100);
    
    translate([WW/2, -4, 2.5]) rotate([-45, 0, 0]) cylinder(30, d1=4.5, d2=4.5, $fn=100);
    translate([WW/2, -4, 2.5]) rotate([-45, 0, 0]) cylinder( panel_thick, d1=7.5, d2=4.5, $fn=100);
    translate([WW/2, -4, 2.5]) rotate([-45, 0, 0]) rotate([0, 180, 0]) cylinder(30, d1=8, d2=8, $fn=100);
    
    translate([WW-15, -4, 2.5]) rotate([-45, 0, 0]) cylinder(30, d1=4.5, d2=4.5, $fn=100);
    translate([WW-15, -4, 2.5]) rotate([-45, 0, 0]) cylinder( panel_thick, d1=8, d2=4.5, $fn=100);
    translate([WW-15, -4, 2.5]) rotate([-45, 0, 0]) rotate([0, 180, 0]) cylinder(30, d1=8, d2=8, $fn=100);
}
}

if(B)
{
difference()
{
    union()
    {
        cube([20, 15, 30]);
    }
    translate([10, -4, 2.5]) rotate([-45, 0, 0]) cylinder(100, d1=3.5, d2=3.5, $fn=100);
    translate([10, -4, 2.5]) rotate([-45, 0, 0]) cylinder( panel_thick, d1=7.5, d2=4.5, $fn=100);
    translate([10, -4, 2.5]) rotate([-45, 0, 0]) rotate([0, 180, 0]) cylinder(30, d1=7.5, d2=7.5, $fn=100);
}
}

if(C)
{
difference()
{
    union()
    {
        translate([0, 0, 0]) cube([15, 20, panel_thick]);
        translate([0, 10, 4/2]) rotate([0, 90, 0]) cylinder(15, d=6, $fn=100);
    }
    translate([15/2, 4, -gap1]) rotate([0, 0, 0]) cylinder(  panel_thick+gap2, d1=2.5, d2=4.5, $fn=100);
    translate([15/2, 20-4, -gap1]) rotate([0, 0, 0]) cylinder(  panel_thick+gap2, d1=2.5, d2=4.5, $fn=100);
    
    translate([-gap1, 10, 4/2]) rotate([0, 90, 0]) cylinder(15+gap2, d=4, $fn=100);
    translate([-gap1, 10-5/2+0.5, -gap1-2]) cube([15+gap2, 4, 4/2+2]);
}
}


module futa()
{
difference()
{
    union()
    {
        translate([WW/2, -Y/2, 0]) cylinder(panel_thick+BHD, d=BR-1, $fn=100);
        translate([WW/2-50/2, -Y/2-10/2, -gap1]) cube([50, 10, panel_thick+BHD]);
    }
    translate([WW/2, -4, 2.5]) rotate([-45, 0, 0]) rotate([0, 180, 0]) cylinder(30, d1=8, d2=8, $fn=100);
    
    rear_screw_hole( WW/2-50/2+6, -Y/2 );
    rear_screw_hole( WW/2+50/2-6, -Y/2 );
}
}



module screw_hole( x, y, z=0 )
{
    hole_height = 5-1.5+1;
    translate( [x, y, z-gap1] )
    {
        cylinder( hole_height, 1.6, 1.6, $fn=30 );
        cylinder( 2.4+0.15, 6.5/2+0.1, 6.5/2+0.1, $fn=6 );
    }
}

module rear_screw_hole( x, y, z=0 )
{
    translate( [x, y, z-gap1] )
    {
        translate( [0, 0, 3] )
        cylinder( 5, 1.5, 1.5, $fn=30 );
        translate( [0, 0, 2.2-gap1] )
        cylinder( 0.8+gap2, 1.5+0.7, 1.5, $fn=30 );
        translate( [0, 0, -gap1] )
        cylinder( 2.2+gap1, 3.25+0.4, 3.25-0.6, $fn=30 );
    }
}