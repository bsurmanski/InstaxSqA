module rail () {
    module rail_part () {
        //base
        translate([0, -3, 0])
        cube(size=[30, 6, 2]);
    
        // rail side 1
        translate([0, -3, 2])
        cube(size=[30, 2, 4]);
    
        // rail side 2
        translate([0, 1, 2])
        cube(size=[30, 2, 4]);
    
        // rail side 2
        translate([0, 1, 2])
        cube(size=[15, 2, 11.2]);
        
            // end 1
        translate([-2, -3, 0])
        cube([2, 6, 13.2]);
    }
    
    union () {
    rail_part();
    translate([0, -8, 0])
    mirror([0,1,0])
    //rotate([0, 180, 0])
    rail_part();
    

    
    // end 2
    //translate([30, -3, 0])
    //cube([2, 6, 11.2]);
    }
}

module slider() {
    union() {
    translate([0.1, -0.8, 2.8])
    cube(size=[20, 1.6, 14]);

    translate([0.1, 0, 2.0])
    rotate([45, 0, 0])
    cube(size=[20, 1.13, 1.13]);
    
    translate([2.1, -2.8, 7.0])
    rotate([0, 45, 0])
    cube(size = [1.41,2,1.41]);
        
    translate([2.1, -2.8, 7])
    cube(size = [2,2,5]);
    
    translate([18, 0.8, 7.0])
    rotate([0, 45, 0])
    cube(size = [1.41,2,1.41]);
        
    translate([18, 0.8, 7])
    cube(size = [2,2,5]);
    }
}

rail();

translate([0, 7, -2])
slider();