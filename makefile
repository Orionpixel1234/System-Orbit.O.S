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

CFLAGS ?= -ffreestanding -fno-builtin -fno-stack-protector -fno-pie -fno-omit-frame-pointer -fno-asynchronous-unwind-tables -fno-exceptions -mno-red-zone -m32 -march=i386 -mtune=i386 -m32 -march=i386 -mtune=i386 -Wall -Wextra -Werror -O0 -g

BOOT_BIN := $(BIN)/boot.bin
BOOT2_O := $(BIN)/boot.o
BOOT2_ELF := $(ELF)/boot.elf
BOOT2_BIN := $(BIN)/boot2.bin
A20_O := $(BIN)/a20.o
GDT_O := $(BIN)/gdt.o
PM_O := $(BIN)/pm.o
BOOTC_O := $(BIN)/bootc.o
KPRINTV_O := $(BIN)/kprintv.o
STRING_O := $(BIN)/string.o
BOOT_IMG := $(IMG)/boot.img

include arch/makefile
include libs/makefile

$(BUILD):
	mkdir $(BUILD)

$(BIN): | $(BUILD)
	mkdir $(BIN)

$(ELF): | $(BUILD)
	mkdir $(ELF)

$(IMG): | $(BIN)
	mkdir $(IMG)

clean:
	rm -rf build

all: clean $(BOOT_IMG)
	qemu-system-x86_64 -drive format=raw,file=$(BOOT_IMG)