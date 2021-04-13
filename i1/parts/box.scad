BOX_Y = 76;
BOX_X = 89.3;
BOX_Z = 29.2;
BOX_THICK = 2;

BOARD_Z = 3;

SCREW_Z = 5;

FN = 64;

// base
cube ([BOX_X, BOX_Y, BOX_THICK]);

// walls
// front wall
cube ([BOX_X, BOX_THICK, BOX_Z]);
// left wall
cube ([BOX_THICK, BOX_Y, BOX_Z]);
// right wall
translate ([BOX_X - BOX_THICK, 0, 0]) {
    cube ([BOX_THICK, BOX_Y, BOX_Z]);
}
// back wall
translate ([0, BOX_Y - BOX_THICK, 0]) {
    cube ([BOX_X, BOX_THICK, BOX_Z]);
}

// boards screw holes
linear_extrude(height = BOARD_Z + BOX_THICK) {
    import(file = "../drawings/camera.dxf", layer = "openscad-box-board", $fn=FN);
}

// cover support
linear_extrude(height = BOX_Z - BOX_THICK) {
    import(file = "../drawings/camera.dxf", layer = "openscad-box-support", $fn=FN);
}

// cover screws holes
linear_extrude(height = BOX_Z - BOX_THICK - SCREW_Z) {
    import(file = "../drawings/camera.dxf", layer = "openscad-box-screwsbase", $fn=FN);
}
linear_extrude(height = BOX_Z - BOX_THICK) {
    import(file = "../drawings/camera.dxf", layer = "openscad-box-screws", $fn=FN);
}
