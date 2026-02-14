BUILD_DIR := build
OVERRIDES :=

# Find OpenSCAD: check PATH first, then macOS app bundle locations
OPENSCAD := $(shell which openscad 2>/dev/null)
ifeq ($(OPENSCAD),)
  OPENSCAD := $(firstword $(wildcard $(HOME)/Applications/OpenSCAD*.app/Contents/MacOS/OpenSCAD))
endif
ifeq ($(OPENSCAD),)
  OPENSCAD := $(firstword $(wildcard /Applications/OpenSCAD*.app/Contents/MacOS/OpenSCAD))
endif
ifeq ($(OPENSCAD),)
  $(error OpenSCAD not found. Install it or add it to your PATH)
endif

SCAD_SOURCES := $(wildcard src/*.scad)

TARGETS := \
	$(BUILD_DIR)/top_plate_padding.stl \
	$(BUILD_DIR)/top_plate_pixels.stl \
	$(BUILD_DIR)/spacer.stl \
	$(BUILD_DIR)/back_plate.stl \
	$(BUILD_DIR)/compartment.stl \
	$(BUILD_DIR)/jig.stl

all: $(TARGETS)

render: $(BUILD_DIR)/render.png

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

$(BUILD_DIR)/top_plate_padding.stl: src/top_plate.scad config.scad | $(BUILD_DIR)
	"$(OPENSCAD)" -o $@ $(OVERRIDES) -D 'part="padding"' $<

$(BUILD_DIR)/top_plate_pixels.stl: src/top_plate.scad config.scad | $(BUILD_DIR)
	"$(OPENSCAD)" -o $@ $(OVERRIDES) -D 'part="pixels"' $<

$(BUILD_DIR)/spacer.stl: src/spacer.scad config.scad | $(BUILD_DIR)
	"$(OPENSCAD)" -o $@ $(OVERRIDES) $<

$(BUILD_DIR)/back_plate.stl: src/back_plate.scad config.scad | $(BUILD_DIR)
	"$(OPENSCAD)" -o $@ $(OVERRIDES) $<

$(BUILD_DIR)/compartment.stl: src/compartment.scad config.scad | $(BUILD_DIR)
	"$(OPENSCAD)" -o $@ $(OVERRIDES) $<

$(BUILD_DIR)/jig.stl: src/jig.scad config.scad | $(BUILD_DIR)
	"$(OPENSCAD)" -o $@ $(OVERRIDES) $<

$(BUILD_DIR)/render.png: src/render.scad $(SCAD_SOURCES) config.scad | $(BUILD_DIR)
	"$(OPENSCAD)" -o $@ $(OVERRIDES) --imgsize=1920,1080 --colorscheme=Tomorrow $<
	magick $@ -transparent "#F8F8F8" $@

clean:
	rm -rf $(BUILD_DIR)

.PHONY: all clean render
