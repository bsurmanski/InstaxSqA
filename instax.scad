// Instax Square cartridge prototype shape
module cartridge() {
    translate([-38, 0, -36.5])
	{
    // main body
    hull () {
        linear_extrude(height=0.01)
        polygon(points=[[0.5, 0],
                        [75.5, 0],
                        [76, -14],
                        [0, -14]]);
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
    
    color("wheat")
    translate([31.5, 0, -36.5])
    cube(size = [2, 1, 25]);
    
    color("peru")
    translate([-32.5, 0, -32.5])
    cube(size = [65, 1, 65]);
}