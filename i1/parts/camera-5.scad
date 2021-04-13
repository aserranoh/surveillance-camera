BASE_Y = 27;
FN = 64;

linear_extrude(height = BASE_Y - 3) {
            import(file = "../drawings/camera.dxf", layer = "openscad-base-hole", $fn=FN);
        }