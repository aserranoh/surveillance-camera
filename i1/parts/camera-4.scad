
BASE_X = 71;
BASE_Y = 27;
BASE_Z = 7;

WALL_X = 7.5;
WALL_Y = BASE_Y;
WALL_Z = 47.1838;

AXIS_H = 4.5;
AXIS_R = 4;
MARGIN = 1;
FN = 64;

SLOT_H = 3;
HOLE3_H = 2.5;

difference () {
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
    translate ([WALL_X - AXIS_H, WALL_Y / 2.0, WALL_Z]) {
    rotate ([0, 90, 0]) {
        cylinder (AXIS_H + MARGIN, AXIS_R, AXIS_R, $fn=FN);
    }
    }
    translate ([BASE_X - WALL_X - MARGIN, WALL_Y / 2.0, WALL_Z]) {
    rotate ([0, 90, 0]) {
        cylinder (AXIS_H + MARGIN, AXIS_R, AXIS_R, $fn=FN);
    }
    }
    
    // Slot
    translate ([-2 * MARGIN, WALL_Y / 2.0, WALL_Z - SLOT_H]) {
    rotate ([0, 0, 90]) {
    rotate ([90, 0, 0]) {
    translate ([0, SLOT_H, 0]) {
    linear_extrude(height = WALL_X) {
        import(file = "../drawings/camera.dxf", layer = "openscad-top1", $fn=FN);
    }
    }
    }
    }
    }
    
    translate ([BASE_X - WALL_X + 2 * MARGIN, WALL_Y / 2.0, WALL_Z - SLOT_H]) {
    rotate ([0, 0, 90]) {
    rotate ([90, 0, 0]) {
    translate ([0, SLOT_H, 0]) {
    linear_extrude(height = WALL_X) {
        import(file = "../drawings/camera.dxf", layer = "openscad-top1", $fn=FN);
    }
    }
    }
    }
    }
    
    // Servo hole
    translate ([BASE_X / 2.0, BASE_Y / 2.0, -MARGIN]) {
    cylinder (BASE_Z + 2 * MARGIN, AXIS_R, AXIS_R, $fn=FN);
    }
    translate ([BASE_X / 2.0, BASE_Y / 2.0, 1.7]) {
    linear_extrude(height = BASE_Z) {
        import(file = "../drawings/camera.dxf", layer = "openscad-servo-hole2", $fn=FN);
    }
    }
    
    // Base hole
    translate ([BASE_X / 2.0, BASE_Y - 3, 4]) {
    rotate ([90, 0, 0]) {
        linear_extrude(height = BASE_Y) {
            import(file = "../drawings/camera.dxf", layer = "openscad-base-hole", $fn=FN);
        }
    }
    }
    
    // Long servo hole
    translate ([BASE_X - 5.5, WALL_Y / 2.0, WALL_Z]) {
    rotate ([0, 0, 90]) {
        rotate ([90, 0, 0]) {
            linear_extrude(height = HOLE3_H) {
                import(file = "../drawings/camera.dxf", layer = "openscad-servo-hole3", $fn=FN);
                }
            }
        }
    }
}
}
