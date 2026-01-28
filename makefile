ARCH ?= x86
BIOS ?= true

BUILD := build
BIN := $(BUILD)/bin
ELF := $(BUILD)/elf
IMG := $(BIN)/img

CC = gcc
AS = nasm
LD = ld
CAT = cat
OBJCOPY = objcopy

BOOT_BIN := $(BIN)/boot.bin
BOOT2_O := $(BIN)/boot.o
BOOT2_ELF := $(ELF)/boot.elf
BOOT2_BIN := $(BIN)/boot2.bin
BOOT_IMG := $(IMG)/boot.img

include arch/makefile

$(BUILD):
	mkdir $(BUILD)

$(BIN): | $(BUILD)
	mkdir $(BIN)

$(ELF): | $(BUILD)
	mkdir $(ELF)

$(IMG): | $(BIN)
	mkdir $(IMG)

all: $(BOOT_IMG)
	qemu-system-x86_64 -drive format=raw,file=$(BOOT_IMG)