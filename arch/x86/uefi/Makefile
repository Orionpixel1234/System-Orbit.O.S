# ================================
# Architecture
# ================================
ARCH     := x86_64
EFI_ARCH := x86_64

# ================================
# Paths (inherited from root)
# ================================
BUILD ?= build
BIN   ?= $(BUILD)/bin
IMG   ?= $(BUILD)/img

UEFI_BIN := $(BIN)/uefi
EFI_APP  := $(UEFI_BIN)/BOOTX64.EFI
ESP_IMG  := $(IMG)/esp.img

# ================================
# Toolchain
# ================================
CC      := gcc
LD      := ld
OBJCOPY := objcopy

# ================================
# gnu-efi (Ubuntu layout)
# ================================
EFI_INC := /usr/include/efi
EFI_LIB := /usr/lib

CRT_OBJ := $(EFI_LIB)/crt0-efi-$(EFI_ARCH).o
LDS     := $(EFI_LIB)/elf_$(EFI_ARCH)_efi.lds

# ================================
# Flags
# ================================
CFLAGS := \
	-I$(EFI_INC) \
	-I$(EFI_INC)/$(ARCH) \
	-fno-stack-protector \
	-fshort-wchar \
	-mno-red-zone \
	-fno-exceptions \
	-ffreestanding \
	-nostdlib \
	-nodefaultlibs \
	-DGNU_EFI_USE_MS_ABI \
	-Wall -Wextra

LDFLAGS := \
	-nostdlib \
	-T $(LDS) \
	-shared \
	-Bsymbolic \
	-L$(EFI_LIB) \
	-lgnuefi \
	-lefi

# ================================
# Sources
# ================================
UEFI_SRC := uefi/boot/boot.c
UEFI_OBJ := $(UEFI_BIN)/boot.o
UEFI_SO  := $(UEFI_BIN)/boot.so

# ================================
# Targets
# ================================
.PHONY: all image clean

all: $(EFI_APP)

# ----------------
# Directories
# ----------------
$(UEFI_BIN):
	mkdir -p $(UEFI_BIN)

$(IMG):
	mkdir -p $(IMG)

# ----------------
# Compile
# ----------------
$(UEFI_OBJ): $(UEFI_SRC) | $(UEFI_BIN)
	$(CC) $(CFLAGS) -c $< -o $@

# ----------------
# Link → EFI
# ----------------
$(EFI_APP): $(UEFI_OBJ)
	$(LD) $(CRT_OBJ) $< $(LDFLAGS) -o $(UEFI_SO)
	$(OBJCOPY) \
		-j .text -j .sdata -j .data -j .dynamic \
		-j .dynsym -j .rel -j .rela -j .reloc \
		--target=efi-app-$(EFI_ARCH) \
		$(UEFI_SO) $@

# ----------------
# ESP image (FAT32)
# ----------------
image: $(EFI_APP) | $(IMG)
	dd if=/dev/zero of=$(ESP_IMG) bs=1M count=64
	mkfs.fat -F32 $(ESP_IMG)
	mmd -i $(ESP_IMG) ::/EFI
	mmd -i $(ESP_IMG) ::/EFI/BOOT
	mcopy -i $(ESP_IMG) $(EFI_APP) ::/EFI/BOOT/BOOTX64.EFI

# ----------------
# Clean
# ----------------
clean:
	rm -rf $(UEFI_BIN) $(ESP_IMG)
