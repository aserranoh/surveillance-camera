
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
HOLE_Y = 13.6;

// Deep of the screws
SCREW_DEEP = 5;

CAMERA_SUPPORT_THICK = 2.7;
CAMERA_JOINT_H = 4;

NUT_H = 1.8;
NUT_DX = 2.25;
NUT2_DEEP = 6.3;

CAMERA_BORDER_H = 2;

// Circles resolution
FN = 64;

// Front panel
difference() {
    cube([BODY_OUT_X, PANEL_THICK, BODY_OUT_Z]);

    // Camera hole
    union () {
    translate([BODY_OUT_X / 2.0, MARGIN, HOLE_Y]) {
        cube([HOLE_W, PANEL_THICK + 2 * MARGIN, HOLE_W], center = true);
    }
    
    translate ([0, PANEL_THICK + MARGIN, 0]) {
rotate ([90, 0, 0]) {
linear_extrude(height = PANEL_THICK + 2 * MARGIN) {
            import(file = "../drawings/camera.dxf", layer = "openscad-base-screws", $fn=FN);
    }
}
}
    }
}

// Camera border
translate ([0, CAMERA_BORDER_H + PANEL_THICK, 0]) {
rotate ([90, 0, 0]) {
        linear_extrude(height = CAMERA_BORDER_H + PANEL_THICK) {
            import(file = "../drawings/camera.dxf", layer = "openscad-camera-border", $fn=FN);
        }
    }
    }

// Camera support
translate ([0, CAMERA_SUPPORT_THICK + PANEL_THICK, 0]) {
    rotate ([90, 0, 0]) {
        linear_extrude(height = CAMERA_SUPPORT_THICK + MARGIN) {
            import(file = "../drawings/camera.dxf", layer = "openscad-camera-support", $fn=FN);
        }
    }
}

// Camera joint
translate ([0, CAMERA_JOINT_H + PANEL_THICK, 0]) {
    rotate ([90, 0, 0]) {
        linear_extrude(height = CAMERA_JOINT_H) {
            import(file = "../drawings/camera.dxf", layer = "openscad-camera-joint", $fn=FN);
        }
    }
}

// Servo support
difference () {
    translate ([0, BODY_IN_Y + PANEL_THICK, 0]) {
        rotate ([90, 0, 0]) {
            linear_extrude(height = BODY_IN_Y) {
                import(file = "../drawings/camera.dxf", layer = "openscad-servo-support", $fn=FN);
            }
        }
    }
    union () {
        translate ([0, BODY_OUT_Y - PANEL_THICK + MARGIN, 0]) {
            rotate ([90, 0, 0]) {
                linear_extrude(height = SCREW_DEEP + MARGIN) {
                    import(file = "../drawings/camera.dxf", layer = "openscad-servo-screws", $fn=FN);
                }
            }
        }
        
        translate ([BODY_OUT_X - NUT_H - PANEL_THICK - NUT_DX, 0, 0]) {
            rotate ([90, 0, 90]) {
                linear_extrude(height = NUT_H) {
                    import(file = "../drawings/camera.dxf", layer = "openscad-servo-nut", $fn=FN);
                }
            }
        }
        
        translate ([BODY_OUT_X - NUT2_DEEP - PANEL_THICK - MARGIN, 0, 0]) {
            rotate ([90, 0, 90]) {
                linear_extrude(height = NUT2_DEEP + MARGIN) {
                    import(file = "../drawings/camera.dxf", layer = "openscad-servo-nut2", $fn=FN);
                }
            }
        }
    }
}

// Bottom panel
cube([BODY_OUT_X, BODY_OUT_Y, PANEL_THICK]);

// Right panel
difference () {
    translate([BODY_OUT_X - PANEL_THICK, 0, 0]) {
        cube([PANEL_THICK, BODY_OUT_Y, BODY_OUT_Z]);
    }
    translate ([BODY_OUT_X - PANEL_THICK - MARGIN, 0, 0]) {
        rotate ([90, 0, 90]) {
            linear_extrude(height = PANEL_THICK + MARGIN * 2) {
                import(file = "../drawings/camera.dxf", layer = "openscad-servo-hole", $fn=FN);
            }
        }
    }
}
