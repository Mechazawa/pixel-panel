BUILD_DIR := build

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

TARGETS := \
	$(BUILD_DIR)/top_plate_padding.stl \
	$(BUILD_DIR)/top_plate_pixels.stl \
	$(BUILD_DIR)/spacer.stl \
	$(BUILD_DIR)/back_plate.stl \
	$(BUILD_DIR)/compartment.stl

all: $(TARGETS)

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

$(BUILD_DIR)/top_plate_padding.stl: src/top_plate.scad config.scad | $(BUILD_DIR)
	"$(OPENSCAD)" -o $@ -D 'part="padding"' $<

$(BUILD_DIR)/top_plate_pixels.stl: src/top_plate.scad config.scad | $(BUILD_DIR)
	"$(OPENSCAD)" -o $@ -D 'part="pixels"' $<

$(BUILD_DIR)/spacer.stl: src/spacer.scad config.scad | $(BUILD_DIR)
	"$(OPENSCAD)" -o $@ $<

$(BUILD_DIR)/back_plate.stl: src/back_plate.scad config.scad | $(BUILD_DIR)
	"$(OPENSCAD)" -o $@ $<

$(BUILD_DIR)/compartment.stl: src/compartment.scad config.scad | $(BUILD_DIR)
	"$(OPENSCAD)" -o $@ $<

clean:
	rm -rf $(BUILD_DIR)

.PHONY: all clean
