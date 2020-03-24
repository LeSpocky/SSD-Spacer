use <MCAD/boxes.scad>
use <honeycomb.scad>

union() {
    # difference() {
        roundedBox([69, 100, 2.4], 8, true);
        roundedBox([69-10, 100-10, 5], 3, true);
    }
    translate([-(69-6)/2,-(100-6)/2,-2.4/2])
        linear_extrude(2.4)
            honeycomb(69-6, 100-6, 10, 1.5);
}
