// PRUSA iteration3
// Extruder cover
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org

include <extruder-main.scad>

module ext_cover()
{
    difference()
    {
        extruder_cover();
        extruder_mount_holes();

        // Easy assembly trim
        translate([5,56,29.3])rotate([0,0,0])cylinder(r1=1.5, r2=1.9, h=1, $fn=20);
        cube([50,50,15.2]);
        translate([-1,-10+0.2,0])cube([50,10,40]);
            
        // Cut out for main body pinda
        if (pindaDia != 18)
        {
            offs = (pindaDia == 12) ? 6 : 5;
            translate([0-soff/2,36,9]) cube([4,10,offs+sensr*2]);
        }
        else
        {
            translate([-20,38,0]) cube([15,15,26.5]);
        }
    }
}

ext_cover();