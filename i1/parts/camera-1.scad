
// Outer width of the "box" that contains the camera
BODY_OUT_W = 54;

// Thickness of the walls of the "box" that contains the camera
PANEL_THICK = 2;

// Inner width of the "box" that contains the camera
BODY_IN_W = BODY_OUT_W - 2 * PANEL_THICK;

// Margin to apply when performing differences
MARGIN = 1;

// With of the camera hole
HOLE_W = 10.5;

// Deep of the screws
SCREW_DEEP = 5;

CAMERA_SUPPORT_THICK = 5;
CAMERA_JOINT_H = 5;

// Dimensions of the servo supports
SERVO_SUPPORT_DEEP = 30.9;
SERVO_SUPPORT_W = 6.3;

// Circles resolution
FN = 64;

// Front panel
difference() {
    cube([BODY_OUT_W, PANEL_THICK, BODY_OUT_W]);

    // Camera hole
    translate([BODY_OUT_W / 2.0, MARGIN, BODY_OUT_W / 2.0]) {
        cube([HOLE_W, PANEL_THICK + 2 * MARGIN, HOLE_W], center = true);
    }
}

// Camera support
translate ([BODY_OUT_W / 2.0, CAMERA_SUPPORT_THICK + PANEL_THICK, BODY_OUT_W / 2.0]) {
    rotate ([90, 0, 0]) {
        linear_extrude(height = CAMERA_SUPPORT_THICK) {
            import(file = "../drawings/camera.dxf", layer = "openscad-camera-support", $fn=FN);
        }
    }
}

// Camera joint
translate ([BODY_OUT_W / 2.0, CAMERA_JOINT_H + PANEL_THICK, BODY_OUT_W / 2.0]) {
    rotate ([90, 0, 0]) {
        linear_extrude(height = CAMERA_JOINT_H) {
            import(file = "../drawings/camera.dxf", layer = "openscad-camera-joint", $fn=FN);
        }
    }
}

// Screw holes
difference () {
translate ([BODY_OUT_W / 2.0, BODY_IN_W + PANEL_THICK, BODY_OUT_W / 2.0]) {
rotate ([90, 0, 0]) {
linear_extrude(height = BODY_IN_W) {
    import(file = "../drawings/camera.dxf", layer = "openscad-screws", $fn=FN);
}
}
}
translate ([BODY_OUT_W / 2.0, BODY_IN_W + PANEL_THICK + MARGIN, BODY_OUT_W / 2.0]) {
rotate ([90, 0, 0]) {
linear_extrude(height = SCREW_DEEP + MARGIN) {
    import(file = "../drawings/camera.dxf", layer = "openscad-screws-2", $fn=FN);
}
}
}
}

// Servo support
difference () {
translate ([BODY_OUT_W / 2.0, SERVO_SUPPORT_DEEP + PANEL_THICK, BODY_OUT_W / 2.0]) {
rotate ([90, 0, 0]) {
linear_extrude(height = SERVO_SUPPORT_DEEP) {
    import(file = "../drawings/camera.dxf", layer = "openscad-servo-support", $fn=FN);
}
}
}
translate ([BODY_OUT_W - PANEL_THICK - SERVO_SUPPORT_W - MARGIN, BODY_OUT_W / 2.0, BODY_OUT_W / 2.0]) {
rotate ([90, 0, 90]) {
linear_extrude(height = SCREW_DEEP + MARGIN) {
    import(file = "../drawings/camera.dxf", layer = "openscad-servo-screws", $fn=FN);
}
}
}
}

// Bottom panel
cube([BODY_OUT_W, BODY_OUT_W, PANEL_THICK]);

// Right panel
difference () {
translate([BODY_OUT_W - PANEL_THICK, 0, 0]) {
    cube([PANEL_THICK, BODY_OUT_W, BODY_OUT_W]);
}
translate ([BODY_OUT_W - PANEL_THICK - MARGIN, BODY_OUT_W / 2.0, BODY_OUT_W / 2.0]) {
rotate ([90, 0, 90]) {
linear_extrude(height = PANEL_THICK + MARGIN * 2) {
    import(file = "../drawings/camera.dxf", layer = "openscad-servo-hole", $fn=FN);
}
}
}
}