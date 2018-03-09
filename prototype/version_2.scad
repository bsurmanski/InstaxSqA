include <../instax.scad>
$fn=20;

//TODO: take into account offset of film from cartridge face. Maybe 1mm?

module film_plane() {
    translate([-29, -2.9, -29])
    cube([58, 8, 58]);
}

//color("cornflowerBlue")
//film_plane();

color("blue")
rotate([0, -90, 0])
cartridge();

//translate([-42.5, -25, -44.5])
//cube([90, 30, 87]);

module fillet_edge(h, r) {
	   difference() {
		  cube([r,h,r]);
		  translate([0, -0.1, 0])
		  rotate([-90, 0, 0])
		  cylinder(r=r, h=h+0.2);
		}
}

module fillet_cube(size, r) {
	hull () {
	translate([size[0] / 2 - r, 0, size[2] / 2 - r])
	rotate([90, 0, 0])
	cylinder(r=r, h=size[1]);

	translate([size[0] / 2 - r, 0, -size[2] / 2 + r])
	rotate([90, 0, 0])
	cylinder(r=r, h=size[1]);

	translate([-size[0] / 2 + r, 0, size[2] / 2 - r])
	rotate([90, 0, 0])
	cylinder(r=r, h=size[1]);

	translate([-size[0] / 2 + r, 0, -size[2] / 2 + r])
	rotate([90, 0, 0])
	cylinder(r=r, h=size[1]);
	}
}

module cartridge_support() {
    module front_support() {
        hull() {
            translate([15, 4, 0])
            rotate([90,0,0])
            cylinder(d=2, h=4);
            
            translate([-15, 4, 0])
            rotate([90,0,0])
            cylinder(d=2, h=4);
        }
    }
    // front, -Z
	 color("lightgreen") {
    translate([-5, 4, 35])
	 fillet_cube(size=[30, 4, 2], r=1);
    // front, +Z
    translate([-5, 4, -35])
	 fillet_cube(size=[30, 4, 2], r=1);
    // front, +X
    translate([35, 4, 0])
	 fillet_cube(size=[2, 4, 30], r=1);
	 }
    
    module bottom_support() {
        hull () {
            rotate([90,0,0])
            cylinder(d1=3, d2=1, h=10);
            
            translate([8, 0, 0])
            rotate([90,0,0])
            cylinder(d1=3, d2=2, h=10);
        }
    }
    
	 color("lightblue") {
    translate([37.75, 3, 20])
    bottom_support();
    translate([37.75, 3, -20])
    bottom_support();
	 }
    
    module side_support(stride) {
        hull () {
            translate([0, 0, -stride])
            rotate([90, 0, 0])
            cylinder(d1=3, d2=1, h=10);
            
            translate([0, 0, stride])
            rotate([90,0,0])
            cylinder(d1=3, d2=3, h=10);
        }
    }
    
	 color("salmon") {
    translate([0, 3, -40.5])
    rotate([0, 180, 0])
    side_support(stride=1.75);
    translate([0, 3, 39.75])
    side_support(stride=1.0);
	 }
}

cartridge_support();

module filmback() {
    // face, +Y
    difference() {
	 translate([2.5, 5, -1])
	 fillet_cube(size=[90, 2, 87], r=1);
    film_plane();
    }
    
    module walls () {
        // bottom, +X
        hull () {
            translate([46.5, 5, -43.5])
            rotate([90, 0, 0])
            cylinder(d=2, h=25);
            translate([46.5, 5, 41.5])
            rotate([90,0,0])
            cylinder(d=2, h=25);
        }
        
        // base, -Z
        hull () {
            translate([46.5, 5, -43.5])
            rotate([90,0,0])
            cylinder(d=2, h=25);
            translate([-41.5, 5, -43.5])
            rotate([90,0,0])
            cylinder(d=2, h=25);
        }
        
        // base, -Z
        hull () {
            translate([46.5, 5, 41.5])
            rotate([90,0,0])
            cylinder(d=2, h=25);
            translate([-41.5, 5, 41.5])
            rotate([90,0,0])
            cylinder(d=2, h=25);
        }
		  
       // Inside fillet edge
	    color("red")
		 translate([40.5, -20, 35.5])
		 fillet_edge(r=5, h=25);
		 color("red")
		 translate([40.5, -20, -37.5])
		 rotate([0, 90, 0])
		 fillet_edge(r=5, h=25);
    }
	 walls();
}
filmback();

module lid() {
	difference() {
	translate([1.5, -18, -0.9])
	fillet_cube(size=[88, 2, 82.8], r=5);
	translate([1.5, -17.9, -0.9])
	fillet_cube(size=[86, 2.2, 80], r=5);
	}
	translate([1.5, -20, -0.9])
	fillet_cube(size=[92, 2.2, 87], r=1);
}

color("pink") 
lid();