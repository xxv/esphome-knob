use <esp-box/esp_box.scad>
use <baffles.scad>
use <shapes.scad>

body_size = [65, 65, 30];
body_round_radius = 5;

$fs=0.5;
$fa=0.5;

m3_dia = 3.3;

wall_thicknesses = [2, 2, 3];

smidge = 0.01;

module top_laser_cut_plate() {
  heatset_sides = 5;

  difference() {
    rounded_square(xy(body_size), body_round_radius);

    translate(xy(body_size)/2) {
      for (flip_y = [0, 1])
	for (flip_x = [0, 1])
	  mirror([0, flip_y, 0])
	    mirror([flip_x, 0, 0])
	      translate(xy(body_size)/2)
		translate([-heatset_sides, -heatset_sides])
		  circle(d=m3_dia);
      circle(d=7);
    }
  }
}

module top() {
  m3_heatset_dia = 4;

  difference() {
    esp_box_top(body_size, body_round_radius, wall_thicknesses, top_holes=true);
    translate([body_size.x/2, body_size.y/2, -smidge]) {
      cylinder(d=55 - smidge * 2, h=wall_thicknesses.z + smidge * 2);
    }


    translate([body_size.x/2, body_size.y/2, 0]) 
      for (rot = [0 : 90 : 360])
	rotate([0, 0, rot + 45])
	  translate([61/2, 0, 0])
	    difference() {
	      translate([0, 0, -smidge])
		cylinder(d=m3_heatset_dia, h=wall_thicknesses.z + smidge * 2);
	    }
  }
    translate([body_size.x/2, body_size.y/2, 0]) {
      led_baffles();

      translate([0, 0, -smidge])
	difference() {
	  cylinder(d=45, h=2);

	  translate([0, 0, -smidge])
	    cube([13, 13, 5], center=true);
	}
    }
}
