/**
  * Instax Square Cartridge holder for Bronica SQA.
  * 
  * It turns out that the Instax Square film is almost exactly
  * the size of medium format 6x6 film negatives used by the Bronica SQA 
  * (The Instax square film area is 62mm x 62mm).
  * This is intended to be 3D printed so that Instax Square pictures
  * can be taken in a Bronica SQA camera.
  *
  * The design consists of a few primary pieces:
  * - The cartridge holder: holds the film catridge in the correct position.
  * - The roller cap: holds film rollers and caps off cartridge access port.
  * - rollers: bursts the chemical packet and spreads chemicals across film area.
 **/

// Instax Square cartridge prototype shape
module cartridge() {
	translate([82, 0, 7])
   rotate([0, -90])
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

// part of filmback. Top connector interface to Bronica
module connector_top(){
  // connector body
  cube(size = [50, 5.1, 2.6]);
   //clip
   //TODO add hooks to connect to bronica body
}

// part of filmback. Bottom connector interface to Bronica
module connector_bottom() {
  cube(size = [57, 5.1, 2.4]);
  //TODO add hooks to connect to bronica body
}

// lip where the filmback connects to the rollerbody.
// Used as positive in filmback and negative in rollercap, so both can connect.
module lipcatch() {
	// lip catch
	translate([-5.4, -20, 2]) {
	 linear_extrude(height=83)
    polygon(points=[[0, 0],
                    [0, 23],
                    [5.5, 23.5], 
                    [5.5, -0.5]]);
	}
}

// body that holds the instax square cartridge
module filmback() {
    difference() 
    {
		union (){
        //case body
        color("gold")
        translate([0, -22, 0])
        cube(size = [90, 27, 87]);

		  color("yellow")
		  lipcatch();

		  // top connector support
		  color("Khaki")
		  {
			 translate([9.5, -5, 85.5])
			 minkowski () {
		      cube(size = [65, 10, 2]);
			   rotate([90, 0, 0])
			   cylinder($fn=60, r=2);
				translate([0, -2, 0])
			   	rotate([0, 90, 0])
			   cylinder($fn=60, r=2);
			 }
		  }
		}
        
      //subtract cartridge from case body
      // minkowski provides a margin, so the fit isn't too tight
      minkowski() {
        cartridge();
        sphere(r=0.25, center=true, $fa=15);
      }

      translate([17.5, 0.1, 84.5])
		connector_top();

		translate([14, 0.1, 2.5])
		connector_bottom();
            
        // film plane box
		  // 1mm margin wider from native filmback 
        translate([13.5,0,15.5])
        cube(size = [58,6,58]);
    }
        
    //light tread. Helps isolate light leaks around edges of filmback.
   module treads (){
      translate([5,5,6])
      cube(size = [1, 0.8, 76]);
      translate([81,5,6])
      cube(size = [1, 0.8, 76]);
      translate([5,5,6])
      cube(size = [77, 0.8, 1]);
     translate([5,5,81])
      cube(size = [77, 0.8, 1]);
   }
	color("red")
   treads();
}

// Inserted into roller cap. Will be used to burst chemical packet
// and spread chemicals over film area.
module roller() {
    cylinder(h=66, r=3);
}

// Grove in rollercap to allow rollers to slide into place.
module roller_grove() {
	union (){
	  minkowski() {
	    translate([-13, -4.6, 10])
	    cube(size=[0.1,6,0.1]);
	    cylinder($fn=60, r=1);
	  }
	  minkowski() {
	    translate([-13, -4.6, 10])
	    cube(size=[8, 0.1, 0.1]);
	    cylinder($fn=60, r=1);
	  }
	}
}

// Cap of filmback that holds rollers and light-proofs cartridge access when loaded.
module rollercap() {
	module roller_cavity() {
	  // roller cavity
	  translate([-17, -12, 11])
	  cube(size=[12, 17.1, 68]);
	}

	module roller_bulge() {
	  difference() {
		 translate([-12, 5, 8])
	    cylinder(r=8, h=75);
		 translate([-12, 3, 10])
	    cylinder(r=6, h=71);
	  }
	}
	
	difference () {
	  // body
	  union (){
		 color("Coral")
	    translate([-20, -22, 0])
	    cube(size=[20, 27, 87]);
		 color("OrangeRed")
		 roller_bulge();
	  }

	  lipcatch();
	  roller_grove();
	  translate([0,0,69])
	  roller_grove();

	  // give the roller cavity 45 degree bevel
	  minkowski () {
	    roller_cavity();
		 //rotate([0, 0, 45])
		 //cube(size=[1.5, 1.5, 0.1]);
	  }

	  
     // film slot
	  translate([-21, -2.5, 13])
	  cube(size=[22, 5, 62]);
	}
}

rollercap();
filmback();

translate([-13, 2.5, 12])
%roller();
translate([-13, -4, 12])
%roller();
