
// Outer width of the "box" that contains the camera
BODY_OUT_X = 43.6;
BODY_OUT_Y = 28.1;
BODY_OUT_Z = 37.912;

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
AXIS_Z = 13.6;
AXIS_Y = 17.2;

SCREWS_DEEP = 5;

// Back panel
difference () {
translate ([0, BODY_OUT_Y, 0]) {
    rotate ([90, 0, 0]) {
    linear_extrude(height = PANEL_THICK) {
        import(file = "../drawings/camera.dxf", layer = "openscad-camera-back", $fn=FN);
    }
}
}
union () {
translate ([0, BODY_OUT_Y + MARGIN, 0]) {
rotate ([90, 0, 0]) {
linear_extrude(height = PANEL_THICK + MARGIN * 2) {
    import(file = "../drawings/camera.dxf", layer = "openscad-servo-screws", $fn=FN);
}
}
}
translate ([BODY_OUT_X / 2 - CABLE_HOLE_W / 2, BODY_OUT_Y - PANEL_THICK - MARGIN, PANEL_THICK - MARGIN]) {
cube ([CABLE_HOLE_W, PANEL_THICK + MARGIN * 2, CABLE_HOLE_H + MARGIN]);
}
}
}

// Left panel
translate ([0, BODY_OUT_Y, 0]) {
    rotate ([90, 0, 0]) {
    linear_extrude(height = BODY_OUT_Y - PANEL_THICK) {
        import(file = "../drawings/camera.dxf", layer = "openscad-camera-left", $fn=FN);
    }
}
}
translate ([MARGIN, AXIS_Y, AXIS_Z]) {
rotate ([0, -90, 0]) {
cylinder (AXIS_H + MARGIN, AXIS_R, AXIS_R, $fn=FN);
}
}

// Screws to front
difference () {
translate ([0, BODY_OUT_Y, 0]) {
rotate ([90, 0, 0]) {
linear_extrude(height = BODY_OUT_Y - PANEL_THICK) {
    import(file = "../drawings/camera.dxf", layer = "openscad-screws", $fn=FN);
}
}
}

translate ([0, SCREWS_DEEP + PANEL_THICK, 0]) {
rotate ([90, 0, 0]) {
linear_extrude(height = SCREWS_DEEP + MARGIN) {
            import(file = "../drawings/camera.dxf", layer = "openscad-base-screws", $fn=FN);
    }
}
}
}