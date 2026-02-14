# Pixel Panel

A 3D-printable pixel art display powered by WS2812B (NeoPixel) LED strips and [WLED](https://kno.wled.ge/) firmware.

![Exploded assembly view](docs/render.png)

## Assembly

The panel is made up of four stacked layers (bottom to top):

| Layer | Description |
|-------|-------------|
| **Electronics compartment** | Enclosed box that houses the controller and wiring. Has configurable holes for cable routing. |
| **Back plate** | Holds the LED strips in cutout channels. Wiring holes at each end let strips bend down into the compartment. |
| **Spacer** | Grid of walls that separates each LED into its own cell, preventing light bleed. Alignment keys on the edge walls slot into the back plate cutouts. |
| **Top plate** | The visible face. Black grid padding with raised white pixel diffuser boxes. Printed in two materials. |

## Hardware

- **LED strips**: Any addressable LED strip (e.g. WS2812B, SK6812). Adjust the LED dimensions in `config.scad` to match your strips.
- **Grid size**: Configurable, default 12x12 pixels
- **Firmware**: [WLED](https://kno.wled.ge/)

## Configuration

All dimensions are defined in `config.scad`. Adjust the grid size, LED strip measurements, and part dimensions there. Changing any value automatically propagates to all parts.

## Building

Requires [OpenSCAD](https://openscad.org/) installed (via PATH or macOS app bundle).

```sh
make          # Build all STL files
make render   # Generate the assembly render
make clean    # Remove build output
```

Output STL files are placed in `build/`:

| File | Material |
|------|----------|
| `top_plate_padding.stl` | Black filament |
| `top_plate_pixels.stl` | Transparent filament |
| `spacer.stl` | Black filament |
| `back_plate.stl` | Black filament |
| `compartment.stl` | Black filament |
| `jig.stl` | Any color (reusable) |

## Gluing jig

The jig holds all layers in alignment while gluing. It's a base plate with L-shaped corner walls that sit slightly above the fully assembled stack. A large hole in the base lets you push the finished assembly out from below.
