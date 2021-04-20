
BASE_X = 60;
BASE_Y = 24;
BASE_Z = 4;

WALL_X = 7.5;
WALL_Y = BASE_Y;
WALL_Z = 36.9272;

AXIS_H = 4.5;
AXIS_R = 4;
MARGIN = 1;
FN = 64;

SLOT_H = 3;
HOLE3_H = 2.5;

SCREWS_H = 6;
SCREWS_Z = 1;

difference () {
    // U shape base
    union () {
        // Base
        cube([BASE_X, BASE_Y, BASE_Z]);
        
        // Walls
        cube([WALL_X, WALL_Y, WALL_Z]);
        translate ([BASE_X - WALL_X, 0, 0]) {
            cube([WALL_X, WALL_Y, WALL_Z]);
        }
    }
    
    union () {
        // Axis holes
        // Left
        translate ([WALL_X - AXIS_H, WALL_Y / 2.0, WALL_Z]) {
            rotate ([0, 90, 0]) {
                cylinder (AXIS_H + MARGIN, AXIS_R, AXIS_R, $fn=FN);
            }
        }
        // Right
        translate ([BASE_X - WALL_X - MARGIN, WALL_Y / 2.0, WALL_Z]) {
            rotate ([0, 90, 0]) {
                cylinder (AXIS_H + MARGIN, AXIS_R, AXIS_R, $fn=FN);
            }
        }
    
        // Servo hole
        // Base (cylinder shape)
        translate ([BASE_X / 2.0, BASE_Y / 2.0, -MARGIN]) {
            cylinder (BASE_Z + 2 * MARGIN, AXIS_R, AXIS_R, $fn=FN);
        }
        // "Propeller" shape
        translate ([BASE_X / 2.0, BASE_Y / 2.0, 1.7]) {
            linear_extrude(height = BASE_Z) {
                import(file = "../drawings/camera.dxf",
                    layer = "openscad-servo-hole2", $fn=FN);
            }
        }
    
        // Long servo hole
        translate ([BASE_X - 5.5, 0, 0]) {
            rotate ([0, 0, 90]) {
                rotate ([90, 0, 0]) {
                    linear_extrude(height = HOLE3_H) {
                        import(file = "../drawings/camera.dxf",
                            layer = "openscad-servo-hole3", $fn=FN);
                    }
                }
            }
        }
        
        // Cover screws
        translate ([0, 0, SCREWS_Z]) {
            linear_extrude(height = SCREWS_H) {
                import(file = "../drawings/camera.dxf",
                        layer = "openscad-servo-screws2", $fn=FN);
            }
        }
    }
}
