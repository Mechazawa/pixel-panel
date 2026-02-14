// General
countX = 8;
countY = 8;

// Based on the LED strips you want to use
ledSize = 4.85;
ledSpacing = 11.7;
ledStripWidth = 10.3;
cellSize = ledSize + ledSpacing;

// Top plate
pixelSpacing = 1.90; 
pixelSize = cellSize - pixelSpacing; 
pixelHeight = 1.00; 
plateHeight = 1.80; 

// Back plate
backPlateHeight = 3.0;
backPlateCutoutWidth = 4.0;
backPlateCutoutDepth = 1.0;
backPlateWiringHole = 3.4;

// Spacer
spacerHeight = 6.0;
spacerWall = 2.0;
spacerKeyHeight = backPlateCutoutDepth - 0.1;
spacerKeyWidth = ledStripWidth - 2;

// Electronics compartment
compartmentHeight = 15.0;
compartmentWall = spacerWall;
compartmentBaseHeight = 2.0;
compartmentHoles = [
  // width, height
  [10, 11], // Bottom
  [0, 0], // Left
  [0, 0], // Right
  [0, 0], // Top
];