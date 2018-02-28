// PRUSA iteration3
// Extruder-body
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org

include <extruder-main.scad>

module m3nut()
{
    difference()
    {    
        cube([2,6,8]);
        translate([-0.5,3,3]) rotate([0,90,0]) cylinder(r=1.25, h=3, $fn=20);
    }
}


module ext_body()
{  

    difference()
    {
       extruder_body();
      extruder_mount_holes();    

        // PINDA entry hole
        translate([-5.5,37,6])rotate([90,0,0])cylinder(r=4.4, h=4, $fn=20); 
    }

}
    
difference()
{
    ext_body();
    
    // remove old pinda
    translate([-20,26,-2]) cube([20,30,30]);

    // screw end larger hole
    translate([-20,40,12])rotate([0,90,0])cylinder(r=1.5, h=24, $fn=20);    
    translate([2,40,11.5])rotate([0,90,0])cylinder(r=1.5, h=3, $fn=20); 
    translate([2,40,12])rotate([0,90,0])cylinder(r=1.5, h=3, $fn=20); 
    translate([2,40,12.5])rotate([0,90,0])cylinder(r=1.5, h=3, $fn=20); 

    // M3 nuts 
    translate([0,46,9]) m3nut();
    translate([0,37,9]) m3nut();
}

module ex_body()
{ 
    // pinda 10mm screw test
////    translate([2-sensr-soff,49,12+sensr*2])rotate([0,-90,0])cylinder(r=1.5, h=12, $fn=20);
//    translate([2-sensr-soff,40,12+sensr*2])rotate([0,-90,0])cylinder(r=1.5, h=10, $fn=20);
//    translate([-9  ,40,12+sensr*2])rotate([-900,0,0])cylinder(r=1.5, h=8, $fn=20);

    difference()
    {
        union()
        {    
            // body
            // round body
            translate([-5.5-sensr-soff,36.5,6+sensr]) rotate([-90,0,0])cylinder(r=8.5+sensr/2, h=19, $fn=20+sensr*2);
            // body block
            translate([-13-soff-sensr,36.5,5+sensr]) cube([17+soff,19,10+sensr]);
            translate([-13-soff-sensr,36.5,15+sensr]) cube([4,19,1+sensr]);
            
            translate([-13-soff,36.5,5]) cube([17,19,10]);
            translate([-13,36.5,15]) cube([5,19,1]);
            
            // Bigger base for pinda mounting hole if 18mm
            if (pindaDia != 8)
            {
                translate([-16,36.5,0]) cube([20,22,10]);
            }
            // extruder body joint
            translate([-0,33.5,0]) cube([3,2,15]);
            translate([0,34,0]) cube([4,12,15]);
            translate([0,35.5,0]) rotate([0,0,45]) cube([2,2,15]);
        }   

        // PINDA lower hole
        translate([-5.5-sensr-soff,50,6+sensr])rotate([-90,0,0])cylinder(r=4.1+sensr, h=40, $fn=20);

        // M3 screws 
        translate([-20-soff,40,12+sensr*2])rotate([0,90,0])cylinder(r=1.5, h=24+sensr*2, $fn=20);    
        translate([-14-sensr*1.3-soff,40,12+sensr*2])rotate([0,90,0])cylinder(r=3, h=5, $fn=20);
        translate([-20-soff,49,12+sensr*2])rotate([0,90,0])cylinder(r=1.5, h=24+sensr*2, $fn=20);    
        translate([-14-sensr*1.3-soff,49,12+sensr*2])rotate([0,90,0])cylinder(r=3, h=5, $fn=20);    
   

        // lower M3 screw end opening
        translate([2-sensr-soff,49,11.5+sensr*2])rotate([0,90,0])cylinder(r=1.5, h=10, $fn=20);    
        translate([2-sensr-soff,49,12+sensr*2])rotate([0,90,0])cylinder(r=1.5, h=10, $fn=20);    
        translate([2-sensr-soff,49,12.5+sensr*2])rotate([0,90,0])cylinder(r=1.5, h=10, $fn=20);    
        // upper M3 screw end opening
        translate([2-sensr-soff,40,11.5+sensr*2])rotate([0,90,0])cylinder(r=1.5, h=10, $fn=20); 
        translate([2-sensr-soff,40,12+sensr*2])rotate([0,90,0])cylinder(r=1.5, h=10, $fn=20); 
        translate([2-sensr-soff,40,12.5+sensr*2])rotate([0,90,0])cylinder(r=1.5, h=10, $fn=20); 
        
        // M3 nuts opening
        translate([0-sensr-soff,46,9+sensr*2]) m3nut();
        translate([0-sensr-soff,37,9+sensr*2]) m3nut();

        // flat bottom side
        translate([-20-soff,33,-10]) cube([30,35,10]);

        // slot
        translate([-6-sensr-soff,33,8+sensr]) cube([1+sensr/4,25,20]);
        // Angle cut in slot
        translate([-6-sensr-soff,33,8+sensr]) rotate([0,3,0]) cube([1+sensr/4,25,20]);

        // 45 / 30 deg edges 
        translate([-15-sensr-soff,32,12+sensr*2]) rotate([45,0,0]) cube([15,10,10]);
        translate([-20-sensr-soff,55,13+sensr*2]) rotate([45,0,0]) cube([30+soff,3,5]);

        translate([-2-soff,45,-1]) rotate([0,30,0]) cube([15,15,25]);
        translate([7-soff/2,46,-1]) rotate([0,0,30]) cube([15,11,30]);

        //PINDA mounting hole
        translate([-5.5-sensr-soff,60,6+sensr])rotate([90,0,0])cylinder(r=4.2+sensr, h=30, $fn=20); 
        translate([-5.5-sensr-soff,41,6+sensr])rotate([90,0,0])cylinder(r=4.4+sensr, h=5, $fn=20); 

        // bottom cut
        translate([-15-sensr*2-soff,54.5,-1-sensr])  cube([20+sensr*2,8,20+sensr*2]); 
        
        for ( i = [0 : 14] )
        {
          translate([-5.5-sensr-soff,39+i,6+sensr])rotate([90,0,0])cylinder(r1=4.5+sensr, r2=3, h=1, $fn=20); 
          translate([-5.5-sensr-soff,40+i,6+sensr])rotate([90,0,0])cylinder(r1=3, r2=4.5+sensr, h=1, $fn=20);
        }
    }
}

ex_body();