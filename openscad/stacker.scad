// vim: ft=javascript

include <common.scad>;

difference() {
  rounded_box([
    body_length,
    body_width,
    body_top_height,
  ], body_round_radius);

  translate([body_rim_width, body_rim_width, -D]) rounded_box([
    body_length - 2 * body_rim_width,
    body_width - 2 * body_rim_width,
    body_top_height + 2 * D
  ], body_round_radius);
}

translate([
  1.25 * body_rim_width, 
  1.25 * body_rim_width, 
  body_top_height - D
]) cylinder(h=2 + D, r=0.75);
