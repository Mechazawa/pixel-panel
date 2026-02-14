include <../config.scad>;

colorBox = "white";
colorPadding = "black";

////// CODE BELOW ////

// Calculate total dimensions
totalWidth = (countX * pixelSize) + (countX * pixelSpacing);
totalDepth = (countY * pixelSize) + (countY * pixelSpacing);

// Create horizontal/vertical black padding strips
color(colorPadding) {
    for (y = [1:countY-1]) {
        translate([0, y * (pixelSize + pixelSpacing) - pixelSpacing/2, 0])
            cube([totalWidth, pixelSpacing, plateHeight]);
    }
    
    for (x = [1:countX-1]) {
        translate([x * (pixelSize + pixelSpacing) - pixelSpacing/2, 0, 0])
            cube([pixelSpacing, totalDepth, plateHeight]);
    }

    translate([0, 0, 0])
        cube([pixelSpacing/2, totalDepth, plateHeight]);
    translate([countX * (pixelSize + pixelSpacing) - pixelSpacing/2, 0, 0])
        cube([pixelSpacing/2, totalDepth, plateHeight]);
    
    translate([0, 0, 0])
        cube([totalWidth, pixelSpacing/2, plateHeight]);
    translate([0,countY * (pixelSize + pixelSpacing) - pixelSpacing/2, 0])
        cube([totalWidth, pixelSpacing/2, plateHeight]);
}

// Create raised boxes (white)
color(colorBox)
    for (x = [0:countX-1]) {
        for (y = [0:countY-1]) {
            translate([pixelSpacing/2 + x * (pixelSize + pixelSpacing), 
                      pixelSpacing/2 + y * (pixelSize + pixelSpacing), 
                      0])
                cube([pixelSize, pixelSize, pixelHeight+ plateHeight]);
        }
    }
