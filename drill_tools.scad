$fn=100;

module drill_guide_mdf() {
    difference() {
        union() {
            cube([50+10, 18, 1]);
            translate([-2, 0, 0]) cube([2, 18, 6]);
            translate([-2, -2, 0]) cube([50+10+2, 2, 6]);
        }
        translate([50, 18/2, -1]) cylinder(d=4.2, h=100, center=true);
    }
}

module drill_guide_inner_cube() {
    size=44;
    difference() {
        union() {
            cube([size, size, 1]);
            translate([-2, 0, 0]) cube([2, size, 3]);
            translate([-2, -2, 0]) cube([size+2, 2, 3]);
        }
        union() {
            for (i=[1/4, 2/4, 3/4]) {
                for (j=[1/4, 2/4, 3/4]) {
                    translate([i*44, j*44, 0]) cylinder(d=2, h=100, center=true);
                }
            }
        }
        
    }
}

drill_guide_inner_cube();
