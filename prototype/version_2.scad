include <../instax.scad>
$fn=20;

module film_plane() {
    translate([-29, -2.9, -29])
    cube([58, 8, 58]);
}

//color("cornflowerBlue")
//film_plane();

rotate([0, -90, 0])
%cartridge();

//translate([-42.5, -25, -44.5])
//cube([90, 30, 87]);

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
    translate([-5, 0, 35])
    front_support();
    // front, +Z
    translate([-5, 0, -35])
    front_support();
    // front, +X
    translate([35, 0, 0])
    rotate([0, 90, 0])
    front_support();
    
    module bottom_support() {
        hull () {
            rotate([90,0,0])
            cylinder(d1=3, d2=1, h=10);
            
            translate([8, 0, 0])
            rotate([90,0,0])
            cylinder(d1=3, d2=2, h=10);
        }
    }
    
    translate([37.75, 3, 20])
    bottom_support();
    
    translate([37.75, 3, -20])
    bottom_support();
    
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
    
    translate([0, 3, -40.5])
    rotate([0, 180, 0])
    side_support(stride=1.75);
    translate([0, 3, 39.75])
    side_support(stride=1.0);
}

cartridge_support();

module filmback() {
    // face, +Y
    difference() {
    hull () {
        translate([46.5, 5, -43.5])
        rotate([90,0,0])
        cylinder(d=2, h=2);
        translate([46.5, 5, 41.5])
        rotate([90,0,0])
        cylinder(d=2, h=2);
        translate([-41.5, 5, -43.5])
        rotate([90,0,0])
        cylinder(d=2, h=2);
        translate([-41.5, 5, 41.5])
        rotate([90,0,0])
        cylinder(d=2, h=2);
    }
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
    }
}
filmback();