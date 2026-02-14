spacing = 1.90; // The spacing inbetween two of the boxes, this spacing is colored black and half size on the rim of the plate
boxSize = 14.90;
boxHeight = 1.00; // The amount it extrudes from the base plate
plateHeight = 1.80; // base plate height
countX = 8;
countY = 8;

colorBox = "white";
colorPadding = "black";

////// CODE BELOW ////

// Calculate total dimensions
totalWidth = (countX * boxSize) + (countX * spacing);
totalDepth = (countY * boxSize) + (countY * spacing);

// Create horizontal/vertical black padding strips
color(colorPadding) {
    for (y = [1:countY-1]) {
        translate([0, y * (boxSize + spacing) - spacing/2, 0])
            cube([totalWidth, spacing, plateHeight]);
    }
    
    for (x = [1:countX-1]) {
        translate([x * (boxSize + spacing) - spacing/2, 0, 0])
            cube([spacing, totalDepth, plateHeight]);
    }

    translate([0, 0, 0])
        cube([spacing/2, totalDepth, plateHeight]);
    translate([countX * (boxSize + spacing) - spacing/2, 0, 0])
        cube([spacing/2, totalDepth, plateHeight]);
    
    translate([0, 0, 0])
        cube([totalWidth, spacing/2, plateHeight]);
    translate([0,countY * (boxSize + spacing) - spacing/2, 0])
        cube([totalWidth, spacing/2, plateHeight]);
}

// Create raised boxes (white)
color(colorBox)
    for (x = [0:countX-1]) {
        for (y = [0:countY-1]) {
            translate([spacing/2 + x * (boxSize + spacing), 
                      spacing/2 + y * (boxSize + spacing), 
                      0])
                cube([boxSize, boxSize, boxHeight+ plateHeight]);
        }
    }
