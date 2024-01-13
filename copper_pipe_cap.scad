$fn = 100;
cut = 100; // arbitrary large dimension

module pipe_cap() {
    difference() {
        union() {
            cylinder(d=13, h=10);
            translate([0, 0 , 10]) cylinder(d1=15, d2=0, h=30);
        }
        cylinder(d=3.5, h=cut, center=true);
    }
}

difference() {
    pipe_cap();
    translate([-cut/2, 0, -1]) cube([cut, cut, cut]);
}
