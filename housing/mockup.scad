use <esp-box/esp_box.scad>
include <housing.scad>

bottom_lip = 1;

d1_mini_board = [26, 35, 1.1];
board_lift = 4;
esp_box_mockup(body_size, body_round_radius, wall_thicknesses);


color("blue")
translate([0, 0, body_size.z - wall_thicknesses.z -bottom_lip ])
linear_extrude(height=3)
  top_laser_cut_plate();

module esp_box_mockup(body_size, body_round_radius, wall_thicknesses) {
  wall_thickness = wall_thicknesses[0];
  top_wall_thickness = wall_thicknesses[1];
  bottom_wall_thickness = wall_thicknesses[2];
  //intersection() { union() {
  translate([0, wall_thickness, board_lift])
    translate(center_x(body_size, d1_mini_board))
      d1_mini_mockup();

  color("green")
  translate([body_size.x, 0, body_size.z -bottom_lip - wall_thicknesses.z])
    rotate([0, 180, 0])
  top();
  color("red")
  translate([0, 0, -bottom_wall_thickness])
    esp_box_bottom(body_size, body_round_radius, wall_thicknesses);
}
