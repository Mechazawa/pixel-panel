include <../config.scad>;

part = "all"; // "all", "padding", or "pixels"

totalWidth = (countX * pixelSize) + (countX * pixelSpacing);
totalDepth = (countY * pixelSize) + (countY * pixelSpacing);

// Black padding grid
if (part == "all" || part == "padding") {
    color("black") {
        for (y = [1:countY-1]) {
            translate([0, y * (pixelSize + pixelSpacing) - pixelSpacing/2, 0])
                cube([totalWidth, pixelSpacing, plateHeight]);
        }

        for (x = [1:countX-1]) {
            translate([x * (pixelSize + pixelSpacing) - pixelSpacing/2, 0, 0])
                cube([pixelSpacing, totalDepth, plateHeight]);
        }

        cube([pixelSpacing/2, totalDepth, plateHeight]);
        translate([countX * (pixelSize + pixelSpacing) - pixelSpacing/2, 0, 0])
            cube([pixelSpacing/2, totalDepth, plateHeight]);

        cube([totalWidth, pixelSpacing/2, plateHeight]);
        translate([0, countY * (pixelSize + pixelSpacing) - pixelSpacing/2, 0])
            cube([totalWidth, pixelSpacing/2, plateHeight]);
    }
}

// White raised pixel boxes
if (part == "all" || part == "pixels") {
    color("white")
        for (x = [0:countX-1]) {
            for (y = [0:countY-1]) {
                translate([pixelSpacing/2 + x * (pixelSize + pixelSpacing),
                          pixelSpacing/2 + y * (pixelSize + pixelSpacing),
                          0])
                    cube([pixelSize, pixelSize, pixelHeight + plateHeight]);
            }
        }
}
