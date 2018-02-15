// Instax Square cartridge prototype shape
module cartridge() {
    translate([-37.5, 0, -36.5])
	{
    // main body
    hull () {
        linear_extrude(height=0.01)
        polygon(points=[[0, 0], 
                        [76, 0], 
                        [75.5, -14], 
                        [0.5, -14]]);
        translate([0, 0, 90])
        linear_extrude(height=0.01)
        polygon(points=[[0.5, 0],
                        [75.5, 0],
                        [76, -19], 
                        [0, -19]]);
    }

   // end grip
    translate([0, 0, 88])
    linear_extrude(height=2)
    polygon(points=[[-1.5, 1],
                    [77.5, 1],
                    [77.5, -19], 
                    [-1.5, -19]]);
    
   // end stop
    translate([0, 0, 72])
    linear_extrude(height=18)
    polygon(points=[[0.5, 1],
                    [75.5, 1],
                    [76, -18], 
                    [0, -18]]);
	}
}

//cartridge();