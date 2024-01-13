// multiplex plaat; 18 mm

multiplex = 18;

module multiplex_plaat(dims, name="") {
    assert(len([ for (x = dims) if (x == multiplex) x ]) == 1);
    otherdims = [ for (x = dims) if (x != multiplex) x ];
    echo(str("BOM: 18 mm multiplex plaat ", otherdims[0], " * ", otherdims[1], " ", name));
    cube(dims);
}

// color([0.5, 0.5, 0.3])
module outer(depth, width_, height_) {
    width = width_+2*multiplex;
    height = height_+2*multiplex;
    // now, outer dimensions are 500, but inner dimensions should be 500
     {
        translate([multiplex, 0, 0]) multiplex_plaat([depth, width, multiplex], name="bottom");
        translate([multiplex,0,multiplex]) multiplex_plaat([depth, multiplex, height-2*multiplex], name="left");
        translate([multiplex,width-multiplex,multiplex]) multiplex_plaat([depth, multiplex, height-2*multiplex], name="right");
        #translate([multiplex,0,height-multiplex]) multiplex_plaat([depth, width, multiplex], name="top");

        translate([0,0,0]) multiplex_plaat([multiplex, width, height], name="back");
        translate([depth+2*multiplex, 0, height]) multiplex_plaat([multiplex, width, height], name="front");
    }
}

module vurenhout_balk(dims) {
    // https://www.hubo.be/nl/p/vurenhout-geschaafd-44x44-mm-210cm/20865/
    assert(len([ for (x = dims) if (x == 44) x ]) == 2);
    t = [ for (x = dims) if (x != 44) x ][0];
    echo(str("BOM: vurenhout_balk 44x44, l=", t));
    cube(dims);
}

module bottom(depth, width, height, explode=0) {
    vurenhout_balk([44, width, 44]);
    translate([depth-44 + 2*explode, 0, 0]) vurenhout_balk([44, width, 44]);
    translate([44+explode, 0, 0]) vurenhout_balk([depth-2*44, 44, 44]);
    translate([44+explode, width-44, 0]) vurenhout_balk([depth-2*44, 44, 44]);
}

module cage(depth, width, height, explode=0) {
    bottom(depth, width, height, explode);
    translate([0, 0, 44+explode]) {
        vurenhout_balk([44, 44, height-2*44]);
        translate([depth-44+2*explode, 0, 0]) vurenhout_balk([44, 44, height-2*44]);
        translate([depth-44+2*explode, width-44, 0]) vurenhout_balk([44, 44, height-2*44]);
        translate([0, width-44, 0]) vurenhout_balk([44, 44, height-2*44]);
    }
    translate([0, 0, height-44+2*explode]) bottom(depth, width, height, explode);
}

// margin for errors
p=5;
outer(500+2*p, 500+2*p, 500+2*p);
translate([multiplex+p, multiplex+p, multiplex+p]) cage(500, 500, 500, explode=0);
