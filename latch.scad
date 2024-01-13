$fn=100;
bolt_height = 7;
bolt_depth = 15;
cut = 100; // arbitary large dimension
move_amount = 30;

body_depth = bolt_depth + 2 * (13);
movement_part_width = move_amount + 10 + (5*2/*upper part of latch width*/);
body_width = movement_part_width + 2*10;


module ccube(size = [1,1,1], center = false)
{
  sz = (len(size) == 3)?size:[size,size,size];
  if (len(center) == 1)
    cube(size, center);
  else
    translate([center[0]?-sz[0]/2:0,center[1]?-sz[1]/2:0,center[2]?-sz[2]/2:0])
    cube(size);
}

module main_body() {
    difference() {
        union() {
            ccube([body_width, body_depth, 3], center=[1, 1, 0]);
            ccube([movement_part_width, bolt_depth+6+0.5, 3+bolt_height+0.5+2], center=[1, 1, 0]);
        }
        union() {
            for (i=[-1, 1]) {
                for (j=[-1,1]) {
                   translate([(body_width/2 - 15)*i, (body_depth/2-5)*j]) {
                    #translate([0, 0, 3-1.5]) cylinder(d1=3, d2=6, h=1.5);
                    cylinder(d=4, h=cut, center=true);
                   }
                   
                }
            }
            translate([0, 0, 3]) ccube([cut, bolt_depth+0.5, bolt_height+0.5], center=[1, 1, 0]);
            translate([0, 0, 3]) ccube([move_amount+10, bolt_depth, cut], center=[1, 1, 0]);
        }
    }
}

module bolt() {
    bolt_width=body_width+20;
    difference() {
        ccube([bolt_width, bolt_depth, bolt_height], center=[0, 1, 0]);
        union() {
            translate([movement_part_width, 0, 1]) cylinder(d=8, h=cut);
            translate([bolt_width, 0, 0]) rotate([0, -45, 0]) ccube([cut, cut, cut], center=[0, 1, 0]);
        }
       
    }
}

module bolt_catcher() {
    catcher_height=90;
    difference() {
        ccube([10, bolt_depth+4, catcher_height], center=[0, 1, 0]);
        union() {
            translate([0, 0, 3]) ccube([cut, bolt_depth+0.5, bolt_height+0.5], center=[1, 1, 0]);
            translate([0, 0, 18+30]) rotate([0, 90, 0]) {
                cylinder(d=3.5, h=cut, center=true);
                translate([0, 0, 10-1.5]) cylinder(d1=3, d2=6, h=1.5);
            }
            translate([0, 0, 18+45]) rotate([0, 90, 0]) {
                cylinder(d=3.5, h=cut, center=true);
                translate([0, 0, 10-1.5]) cylinder(d1=3, d2=6, h=1.5);
            }
            translate([0, 0, 18+60]) rotate([0, 90, 0]) {
                cylinder(d=3.5, h=cut, center=true);
                translate([0, 0, 10-1.5]) cylinder(d1=3, d2=6, h=1.5);
            }
        }
    }
    
}

main_body();

translate([-body_width/2, 40, 3]) bolt();

translate([body_width/2, -40, 3+bolt_height+3]) mirror([0, 0, 1]) bolt_catcher();

% translate([body_width/2,0, 0]) mirror([1, 0, 0]) mirror([0, 0, 1]) ccube([100, 100, 18], center=[0, 1, 0]);