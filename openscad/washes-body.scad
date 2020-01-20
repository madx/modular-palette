// vim: ft=javascript

include <common.scad>;

wash_well_diameter = well_diameter * 2 + well_margin;

module for_each_well() {
  padding = well_radius * 2 + well_margin / 2 + body_padding;
  translate([padding, padding, body_height + body_top_height]) {
    for (x = [0 : (wells_x - 1) / 2]) {
      for (y = [0 : (wells_y - 1) / 2]) {
        translate([
          x * (wash_well_diameter + well_margin),
          y * (wash_well_diameter + well_margin),
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
      cylinder(d=wash_well_diameter + 2, h = lip_height);
      translate([0, 0, -D]) cylinder(d=wash_well_diameter, h = lip_height + 2*D);
    }
  }
}

module washes_body() {
  difference() {
    body();

    for_each_well() {
      resize([wash_well_diameter, wash_well_diameter, well_diameter]) sphere(d=wash_well_diameter);
    } 
  }
}

washes_body();
