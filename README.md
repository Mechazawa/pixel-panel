# Pixel Panel

A 3D-printable pixel art display powered by WS2812B (NeoPixel) LED strips and [WLED](https://kno.wled.ge/) firmware.

<table>
  <tr>
    <td align="center"><img src="docs/demo.avif" alt="Demo video" height="600"></td>
    <td align="center"><img src="docs/render.png" alt="Exploded assembly view" height="600"></td>
  </tr>
</table>


## Assembly

The panel is made up of four stacked layers (bottom to top):

| Layer                       | Description                                                                                                                                         |
| --------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Electronics compartment** | Enclosed box that houses the controller and wiring. Has configurable holes for cable routing.                                                       |
| **Back plate**              | Holds the LED strips in cutout channels. Wiring holes at each end let strips bend down into the compartment.                                        |
| **Spacer**                  | Grid of walls that separates each LED into its own cell, preventing light bleed. Alignment keys on the edge walls slot into the back plate cutouts. |
| **Top plate**               | The visible face. Black grid padding with raised white pixel diffuser boxes. Printed in two materials.                                              |

<table>
  <tr>
    <td align="center"><img src="docs/back_plate-front-closeup.webp" alt="LED strips seated in back plate channels" width="300"></td>
    <td align="center"><img src="docs/back_plate-back-closeup.webp" alt="Wiring slots at the edge of the back plate" width="300"></td>
  </tr>
  <tr>
    <td><em>LED strips seated in the back plate channels</em></td>
    <td><em>Wiring slots at the edge route strips into the compartment</em></td>
  </tr>
</table>

## Downloads

> "SO WHY THE FUCK IS THERE CODE? make an ~~EXE~~ STL file and give it to me. STUPID FUCKING SMELLY NERDS"
>
> - [automatic_purpose\_](https://www.reddit.com/r/github/comments/1at9br4/i_am_new_to_github_and_i_have_lots_to_say/) 2024

Grab the latest pre-built STLs from the [releases page](https://github.com/Mechazawa/pixel-panel/releases). Pick the zip that matches your LED strip and grid size:

- **WS2812B / SK6812 — 30 LEDs/m** (~33mm between LEDs, 10mm strip width)
  - `pixel-panel-5050-30leds-8x8.zip`
  - `pixel-panel-5050-30leds-12x12.zip`
- **WS2812B / SK6812 — 60 LEDs/m** (~17mm between LEDs, 10mm strip width)
  - `pixel-panel-5050-60leds-8x8.zip`
  - `pixel-panel-5050-60leds-12x12.zip`

If your strip isn't listed, see the [Building](#building) section to generate STLs for any strip dimensions.

## Hardware

- **LED strips**: Any addressable LED strip (e.g. WS2812B, SK6812). Adjust the LED dimensions in `config.scad` to match your strips.
- **Microcontroller**: Any microcontroller [compatible](https://kno.wled.ge/basics/compatible-controllers/) with [WLED](https://kno.wled.ge/)
- **Firmware**: [WLED](https://kno.wled.ge/)

## Configuration

All dimensions are defined in `config.scad`. Adjust the grid size, LED strip measurements, and part dimensions there. Changing any value automatically propagates to all parts.

## Building

Requires [OpenSCAD](https://openscad.org/) installed (via PATH or macOS app bundle). Currently only Linux and MacOS are supported.

```sh
make          # Build all STL files
make render   # Generate the assembly render
make clean    # Remove build output
```

Output STL files are placed in `build/`:

| File                    | Material             |
| ----------------------- | -------------------- |
| `top_plate_padding.stl` | Black filament       |
| `top_plate_pixels.stl`  | Transparent filament |
| `spacer.stl`            | Black filament       |
| `back_plate.stl`        | Black filament       |
| `compartment.stl`       | Black filament       |
| `jig.stl`               | Any color (reusable) |

## Gluing jig

The jig holds all layers in alignment while gluing.
It's a base plate with L-shaped corner walls that sit slightly above the fully assembled stack.
A large hole in the base lets you push the finished assembly out from below.

## Acknowledgements

Inspired by [Misfitwrx](https://makerworld.com/en/@Misfitwrx)'s [original design on MakerWorld](https://makerworld.com/models/64716), which also has excellent assembly instructions.
