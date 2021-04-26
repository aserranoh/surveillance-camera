
// Outer width of the "box" that contains the camera
BODY_OUT_X = 43.6;
BODY_OUT_Y = 28.1;
BODY_OUT_Z = 37.912;

// Thickness of the walls of the "box" that contains the camera
PANEL_THICK = 2;

// Inner width of the "box" that contains the camera
BODY_IN_Y = BODY_OUT_Y - 2 * PANEL_THICK;

// Margin to apply when performing differences
MARGIN = 1;

// With of the camera hole
HOLE_W = 10.5;
HOLE_Y = 18.6;

// Deep of the screws
SCREW_DEEP = 5;

CAMERA_SUPPORT_THICK = 5;
CAMERA_JOINT_H = 4;

CAMERA_BORDER_H = 2;

SERVO_SUPPORT2_H = 11.3;

// Circles resolution
FN = 64;

// Front panel
difference() {
    translate ([0, PANEL_THICK, 0]) {
        rotate ([90, 0, 0]) {
            linear_extrude(height = PANEL_THICK) {
                import(file = "../drawings/camera.dxf",
                    layer = "openscad-camera-front", $fn=FN);
            }
        }
    }

    union () {
        // Camera hole
        translate([BODY_OUT_X / 2.0, MARGIN, HOLE_Y]) {
            cube([HOLE_W, PANEL_THICK + 2 * MARGIN, HOLE_W], center = true);
        }

        // Screws to attach the front part to the back part
        translate ([0, PANEL_THICK + MARGIN, 0]) {
            rotate ([90, 0, 0]) {
                linear_extrude(height = PANEL_THICK + 2 * MARGIN) {
                    import(file = "../drawings/camera.dxf",
                        layer = "openscad-base-screws", $fn=FN);
                }
            }
        }
    }
}

// Camera border
translate ([0, CAMERA_BORDER_H + PANEL_THICK, 0]) {
    rotate ([90, 0, 0]) {
        linear_extrude(height = CAMERA_BORDER_H + PANEL_THICK) {
            import(file = "../drawings/camera.dxf",
                layer = "openscad-camera-border", $fn=FN);
        }
    }
}

// Camera support
translate ([0, CAMERA_SUPPORT_THICK + PANEL_THICK, 0]) {
    rotate ([90, 0, 0]) {
        linear_extrude(height = CAMERA_SUPPORT_THICK + MARGIN) {
            import(file = "../drawings/camera.dxf",
                layer = "openscad-camera-support", $fn=FN);
        }
    }
}

// Camera joint
translate ([0, CAMERA_JOINT_H + PANEL_THICK, 0]) {
    rotate ([90, 0, 0]) {
        linear_extrude(height = CAMERA_JOINT_H) {
            import(file = "../drawings/camera.dxf",
                layer = "openscad-camera-joint", $fn=FN);
        }
    }
}

// Servo support
difference () {
    translate ([0, BODY_IN_Y + PANEL_THICK, 0]) {
        rotate ([90, 0, 0]) {
            linear_extrude(height = BODY_IN_Y) {
                import(file = "../drawings/camera.dxf",
                    layer = "openscad-servo-support", $fn=FN);
            }
        }
    }

    // Screws to fix the back part
    translate ([0, BODY_OUT_Y - PANEL_THICK + MARGIN, 0]) {
        rotate ([90, 0, 0]) {
            linear_extrude(height = SCREW_DEEP + MARGIN) {
                import(file = "../drawings/camera.dxf",
                    layer = "openscad-servo-screws", $fn=FN);
            }
        }
    }
}

// Servo support 2
translate ([0, SERVO_SUPPORT2_H, 0]) {
    rotate ([90, 0, 0]) {
        linear_extrude(height = SERVO_SUPPORT2_H) {
            import(file = "../drawings/camera.dxf",
                layer = "openscad-servo-support2", $fn=FN);
        }
    }
}

// Panels
difference () {
    // Panels
    translate ([0, BODY_OUT_Y, 0]) {
        rotate ([90, 0, 0]) {
            linear_extrude(height = BODY_OUT_Y) {
                import(file = "../drawings/camera.dxf",
                    layer = "openscad-camera-walls", $fn=FN);
            }
        }
    }

    translate ([BODY_OUT_X - PANEL_THICK - MARGIN, 0, 0]) {
        rotate ([90, 0, 90]) {
            linear_extrude(height = PANEL_THICK + MARGIN * 2) {
                import(file = "../drawings/camera.dxf",
                    layer = "openscad-servo-hole", $fn=FN);
            }
        }
    }
}
