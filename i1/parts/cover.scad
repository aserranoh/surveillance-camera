
COVER_X = 85.3;
COVER_Y = 72;
COVER_THICK = 2;
MARGIN = 1;
BOX_THICK = 2;

FN = 64;

difference () {
// base
    translate ([BOX_THICK, BOX_THICK, 0]) {
        cube ([COVER_X, COVER_Y, COVER_THICK]);
    }

    // screw holes
    translate ([0, 0, -MARGIN]) {
        linear_extrude(height = COVER_THICK + 2 * MARGIN) {
            import(file = "../drawings/camera.dxf", layer = "openscad-cover-screws", $fn=FN);
        }
    }
}
