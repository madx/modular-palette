// vim: ft=javascript

D = 1; // Small offset to avoid flush cuts
// $fa = 20;
// $fs = 0.1;
$fn = 80;

wells_x = 4;
wells_y = 4;
well_diameter = 16;
well_radius = well_diameter / 2;
well_margin = 6;

body_height = well_radius;
body_top_height = 2;
body_rim_width = 3;
body_padding = 9;
body_round_radius = 7;
body_length = 
  2 * body_padding + 
  wells_x * well_diameter + 
  (wells_x - 1) * well_margin;
body_width = 
  2 * body_padding + 
  wells_y * well_diameter + 
  (wells_y - 1) * well_margin;

lip_height = 3;


module rounded_box(size=[1, 1, 1], radius) {
  translate([radius, radius, 0]) {
    minkowski() {
      cube([size[0] - 2 * radius, size[1] - 2 * radius, size[2] - 1]);
      cylinder(h = 1, r = radius);
    }
  }
}

module body() {
    union() {
      // Body base
      rounded_box([ body_length, body_width, body_height ], body_round_radius);

      // Body top
      translate([ body_rim_width, body_rim_width, body_height - D ]) rounded_box([
        body_length - 2 * body_rim_width,
        body_width - 2 * body_rim_width,
        body_top_height + D
      ], body_round_radius);
    }
}

echo(str("### Length: ", body_length));
echo(str("### Width: ", body_width));
echo(str("### Height: ", body_height + body_top_height + lip_height));
