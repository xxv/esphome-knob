module rounded_square(size, round_radius) {
  translate([round_radius, round_radius])
    minkowski() {
      circle(r=round_radius);
      square(size - [round_radius*2, round_radius*2]);
    };
}

module rounded_cube(size, round_radius) {
  linear_extrude(height=size.z)
    rounded_square([size.x, size.y], round_radius);
}
