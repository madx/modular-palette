// vim: ft=javascript

include <common.scad>;

module for_each_well() {
  padding = well_radius + body_padding;
  translate([padding, padding, body_height + body_top_height]) {
    for (x = [0 : wells_x - 1]) {
      for (y = [0 : wells_y - 1]) {
        translate([
          x * (well_diameter + well_margin),
          y * (well_diameter + well_margin),
          0
        ]) {
          children();
        }
      } 
    }
  }
}

module lips() {
  for_each_well() { // Well rims
    translate([0, 0, -D]) difference() {
      cylinder(d=well_diameter + 2, h = lip_height);
      translate([0, 0, -D]) cylinder(d=well_diameter, h = lip_height + 2*D);
    }
  }
}


module main_body() {
  difference() {
    body();

    for_each_well() {
      sphere(d=well_diameter);
    } 
  }
}

main_body();
