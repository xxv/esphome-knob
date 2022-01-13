inner_dia = 45;
outer_dia = 55;

leds = 40;
rot_offset = 3.6;

wall = 1;

m3_heatset_depth = 4.5;
m3_heatset_dia = 4;
m3_heatset_standoffs = 7;

height = m3_heatset_depth;
smidge = 0.01;

$fa=0.5;
$fs=0.5;

module led_baffles() {
  difference() {
    cylinder(h=height, d=outer_dia);

    translate([0, 0, -smidge])
      cylinder(h=height + smidge * 2, d=outer_dia - 1.5);
  }

  for (rot = [0 : 360/leds : 360])
    rotate([0, 0, rot + rot_offset])
      rotate_extrude(angle=2)
        translate([inner_dia/2 - smidge, 0])
          square([(outer_dia - inner_dia)/2, height]);

  difference() {
    cylinder(h=height, d=inner_dia);

    translate([0, 0, -smidge])
      cylinder(h=height + smidge * 2, d=inner_dia - 2);
  }

  for (rot = [0 : 90 : 360])
    rotate([0, 0, rot + 45])
      translate([61/2, 0, 0])
        difference() {
          cylinder(d=m3_heatset_standoffs, h=height);
          translate([0, 0, -smidge])
            cylinder(d=m3_heatset_dia, h=height + smidge * 2);
        }
}
