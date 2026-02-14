include <../config.scad>;

spacerOpeningSize = cellSize - spacerWall;

totalWidth = countX * cellSize;
totalDepth = countY * cellSize;

// Inner horizontal walls
for (y = [1:countY-1]) {
    translate([0, y * cellSize - spacerWall/2, 0])
        cube([totalWidth, spacerWall, spacerHeight]);
}

// Inner vertical walls
for (x = [1:countX-1]) {
    translate([x * cellSize - spacerWall/2, 0, 0])
        cube([spacerWall, totalDepth, spacerHeight]);
}

// Edge walls
cube([spacerWall/2, totalDepth, spacerHeight]);
translate([totalWidth - spacerWall/2, 0, 0])
    cube([spacerWall/2, totalDepth, spacerHeight]);

cube([totalWidth, spacerWall/2, spacerHeight]);
translate([0, totalDepth - spacerWall/2, 0])
    cube([totalWidth, spacerWall/2, spacerHeight]);

// Keys on edge walls that align with back plate cutouts
for (y = [0:countY-1]) {
    // Left edge wall
    translate([0,
               y * cellSize + (cellSize - spacerKeyWidth) / 2,
               spacerHeight])
        cube([spacerWall/2, spacerKeyWidth, spacerKeyHeight]);

    // Right edge wall
    translate([totalWidth - spacerWall/2,
               y * cellSize + (cellSize - spacerKeyWidth) / 2,
               spacerHeight])
        cube([spacerWall/2, spacerKeyWidth, spacerKeyHeight]);
}
