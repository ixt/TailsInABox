// Tails In A Box Model
// 2017 CC-0

// Body
translate([0,35/2,0]){
	difference(){
	hull(){
		translate([0,0,45]){
			resize([75,35,35])sphere(75/2);
		}
		translate([0,0,45/2]){
			resize([75,35,55])cube(75,center=true);
		}
	}
	
	translate([65/2,-20,35])rotate([90,0,180]){
	linear_extrude(height=20)square([65,10]);
	}
	
	translate([65/2,-10,2.5])rotate([90,0,180]){
	linear_extrude(height=20)square([65,15]);
	}
	
	translate([15/2,-20,8.5])rotate([90,0,180]){
	linear_extrude(height=20)square([15,7]);
	}
	
	translate([0,7.5,45/2]){
		resize([70,21,50])cube(75,center=true);
	}
	
	translate([-30,5,15])rotate([0,0,180]){
	linear_extrude(height=20)square([15,7]);
	}
	
	}
}

// Lid
translate([0,0,100]){
	difference(){
	union(){
		resize([74,2,54])cube(75,center=true);
		translate([0,2.5,0]){
			resize([70,4,50])cube(75,center=true);
		}
	}
	translate([30,-10,-20])rotate([90,0,180])cylinder(h=30, r=3.5);
	}
}
