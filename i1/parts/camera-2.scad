
// Outer width of the "box" that contains the camera
BODY_OUT_W = 54;

// Thickness of the walls of the "box" that contains the camera
PANEL_THICK = 2;

// Margin to apply when performing differences
MARGIN = 1;

// Circles resolution
FN = 64;

// Cable hole dimensions
CABLE_HOLE_W = 18;
CABLE_HOLE_H = 2;

// Axis dimensions
AXIS_H = 5;
AXIS_R = 3.5;

// Back panel
difference () {
translate ([0, BODY_OUT_W - PANEL_THICK, PANEL_THICK]) {
    cube([BODY_OUT_W - PANEL_THICK, PANEL_THICK, BODY_OUT_W - PANEL_THICK]);
}
union () {
translate ([BODY_OUT_W / 2.0, BODY_OUT_W + MARGIN, BODY_OUT_W / 2.0]) {
rotate ([90, 0, 0]) {
linear_extrude(height = PANEL_THICK + MARGIN * 2) {
    import(file = "../drawings/camera.dxf", layer = "openscad-screws-2", $fn=FN);
}
}
}
translate ([BODY_OUT_W / 2 - CABLE_HOLE_W / 2, BODY_OUT_W - PANEL_THICK - MARGIN, PANEL_THICK - MARGIN]) {
cube ([CABLE_HOLE_W, PANEL_THICK + MARGIN * 2, CABLE_HOLE_H + MARGIN]);
}
}
}

// Left panel
translate ([0, PANEL_THICK, PANEL_THICK]) {
    cube([PANEL_THICK, BODY_OUT_W - PANEL_THICK, BODY_OUT_W - PANEL_THICK]);
}
translate ([MARGIN, BODY_OUT_W / 2, BODY_OUT_W / 2]) {
rotate ([0, -90, 0]) {
cylinder (AXIS_H + MARGIN, AXIS_R, AXIS_R, $fn=FN);
}
}

// Top panel
translate ([0, PANEL_THICK, BODY_OUT_W - PANEL_THICK]) {
cube([BODY_OUT_W - PANEL_THICK, BODY_OUT_W - PANEL_THICK, PANEL_THICK]);
}