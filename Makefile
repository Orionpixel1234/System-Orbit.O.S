# ================================
# Project configuration
# ================================
ARCH    ?= x86
BUILD   := build
BIN     := $(BUILD)/bin
IMG     := $(BUILD)/img

# Tools
QEMU    := qemu-system-x86_64

# QEMU (root does NOT assume BIOS)
QEMU_FLAGS := \
	-m 4G \
	-no-reboot \
	-drive if=pflash,format=raw,readonly=on,file=ovmf/OVMF_CODE.fd \
	-drive if=pflash,format=raw,file=ovmf/OVMF_VARS.fd \
	-drive format=raw,file=$(IMG)/esp.img

# ================================
# Default target
# ================================
.PHONY: all
all: image

# ================================
# Directory setup
# ================================
$(BUILD):
	mkdir -p $(BUILD)

$(BIN): | $(BUILD)
	mkdir -p $(BIN)

$(IMG): | $(BUILD)
	mkdir -p $(IMG)

# ================================
# Architecture delegation
# ================================
.PHONY: bootloader
bootloader:
	$(MAKE) -C arch/$(ARCH)

# ================================
# Image creation (delegated)
# ================================
.PHONY: image
image: | $(IMG) bootloader
	$(MAKE) -C arch/$(ARCH) image IMG=$(IMG)

# ================================
# Run in QEMU (UEFI only)
# ================================
.PHONY: run
run: image
	$(QEMU) $(QEMU_FLAGS)

# ================================
# Cleanup
# ================================
.PHONY: clean
clean:
	rm -rf $(BUILD)
	$(MAKE) -C arch/$(ARCH) clean
