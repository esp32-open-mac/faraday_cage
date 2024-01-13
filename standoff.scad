$fn=100;
cut = 100; // arbitary large dimension

difference() {
    cylinder(d=20, h=10);
    union() {
        cylinder(d=4.5, h=cut, center=true);
        translate([0, 0, 10-2]) cylinder(d1=4, d2=8, h=2);
    }
}