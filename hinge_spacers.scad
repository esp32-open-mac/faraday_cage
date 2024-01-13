$fn=100;
cut = 100;


difference() {
    cube([15, 30, 1.5]);
    translate([15/2, 7.5, 0]) cylinder(d=5, h=cut, center=true);
    translate([15/2, 30-7.5, 0]) cylinder(d=5, h=cut, center=true);
}

