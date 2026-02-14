include <../config.scad>;

module spacer() {
    totalWidth = countX * cellSize;
    totalDepth = countY * cellSize;
    halfWall = spacerWall / 2;

    // Inner horizontal walls
    for (y = [1:countY-1]) {
        translate([0, y * cellSize - halfWall, 0])
            cube([totalWidth, spacerWall, spacerHeight]);
    }

    // Inner vertical walls
    for (x = [1:countX-1]) {
        translate([x * cellSize - halfWall, 0, 0])
            cube([spacerWall, totalDepth, spacerHeight]);
    }

    // Edge walls
    for (offset = [0, totalWidth - halfWall]) {
        translate([offset, 0, 0])
            cube([halfWall, totalDepth, spacerHeight]);
    }

    for (offset = [0, totalDepth - halfWall]) {
        translate([0, offset, 0])
            cube([totalWidth, halfWall, spacerHeight]);
    }

    // Keys on edge walls that align with back plate cutouts
    for (y = [0:countY-1]) {
        keyY = y * cellSize + (cellSize - spacerKeyWidth) / 2;

        for (xOffset = [0, totalWidth - halfWall]) {
            translate([xOffset, keyY, spacerHeight])
                cube([halfWall, spacerKeyWidth, spacerKeyHeight]);
        }
    }
}

spacer();
