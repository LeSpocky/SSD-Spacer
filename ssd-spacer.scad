use <MCAD/boxes.scad>
use <honeycomb.scad>

difference() {
    translate([0,0,2.5/2]) {
        roundedBox([69, 100, 2.4], 5, true);
    }
    difference() {
        linear_extrude(5)
            square([59,90],true);
        translate([-68/2+3,-99/2+1,-2.5])
            linear_extrude(10)
                honeycomb(68, 99, 10, 1.5);
    }
}
