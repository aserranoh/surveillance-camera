THICKNESS = 7.5;
FN = 64;
AXIS_H = 4.5;
MARGIN = 1;
AXIS_R = 4;

BASE_Y = 27;
WALL_X = 7.5;
WALL_Y = BASE_Y;

SLOT_H = 3;

difference () {
linear_extrude(height = THICKNESS) {
    import(file = "../drawings/camera.dxf", layer ="openscad-top1", $fn=FN);
}
union () {
translate ([0, 0, THICKNESS - AXIS_H]) {
cylinder (AXIS_H + MARGIN, AXIS_R, AXIS_R, $fn=FN);
}
translate ([-WALL_Y / 2.0, -SLOT_H, WALL_X - 2 * MARGIN]) {
cube([WALL_Y, SLOT_H, WALL_X]);
}
}
}
