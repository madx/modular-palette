// vim: ft=javascript

include <common.scad>;

wet_palette_offset = body_rim_width + 2;
wet_palette_body_length = body_length - 2 * wet_palette_offset;
wet_palette_body_width = body_width - 2 * wet_palette_offset;
wet_palette_corner_radius = 5;

module wet_palette_body() {
  difference() {
    body();

    translate([wet_palette_offset, wet_palette_offset, 3]) rounded_box([
      wet_palette_body_length,
      wet_palette_body_width,
      body_height + body_top_height
    ], wet_palette_corner_radius);
  };
}

wet_palette_body();
