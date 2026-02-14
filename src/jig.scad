include <../config.scad>;

module jig() {
    assemblyWidth = countX * cellSize;
    assemblyDepth = countY * cellSize;
    assemblyHeight = compartmentHeight + backPlateHeight + spacerHeight
                     + spacerKeyHeight + plateHeight + pixelHeight;

    outerWidth = assemblyWidth + 2 * (jigClearance + jigWall);
    outerDepth = assemblyDepth + 2 * (jigClearance + jigWall);
    wallHeight = assemblyHeight + 1;
    inset = jigClearance + jigWall;

    // Base plate with push-out hole
    difference() {
        cube([outerWidth, outerDepth, jigBaseHeight]);

        translate([inset + jigHoleMargin, inset + jigHoleMargin, -0.1])
            cube([assemblyWidth - 2 * jigHoleMargin,
                  assemblyDepth - 2 * jigHoleMargin,
                  jigBaseHeight + 0.2]);
    }

    // L-shaped corner walls (generate all 4 from one definition)
    for (mx = [0, 1]) {
        for (my = [0, 1]) {
            mirror([mx, 0, 0])
                mirror([0, my, 0])
                    translate([mx * -outerWidth, my * -outerDepth, jigBaseHeight])
                        _jig_corner(outerWidth, outerDepth, wallHeight - jigBaseHeight);
        }
    }
}

module _jig_corner(outerWidth, outerDepth, wallHeight) {
    // Wall along X axis
    cube([jigCornerLength + jigWall, jigWall, wallHeight]);

    // Wall along Y axis
    cube([jigWall, jigCornerLength + jigWall, wallHeight]);
}

jig();
