// vim: ft=javascript

include <common.scad>;
use <main-body.scad>;
use <washes-body.scad>;
use <wet-palette-body.scad>;

translate([0 * body_length + 0 * body_padding, 0, 0]) main_body();
translate([1 * body_length + 1 * body_padding, 0, 0]) washes_body();
translate([2 * body_length + 2 * body_padding, 0, 0]) wet_palette_body();
