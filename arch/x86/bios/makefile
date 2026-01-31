BIOS_PATH := arch/x86/bios

BOOT_SRC ?= $(BIOS_PATH)/boot.asm
BOOT2_SRC ?= $(BIOS_PATH)/boot2.asm
A20_SRC ?= $(BIOS_PATH)/a20.asm
GDT_SRC ?= $(BIOS_PATH)/gdt.asm
PM_SRC ?= $(BIOS_PATH)/pm.asm
BOOTC_SRC ?= $(BIOS_PATH)/boot.c
LINKER_BOOT_SCRIPT ?= $(BIOS_PATH)/linker.ld

$(BOOT_BIN): $(BOOT_SRC) | $(BIN)
	$(AS) -f bin $(BOOT_SRC) -o $(BOOT_BIN)

$(A20_O): $(A20_SRC) | $(BIN)
	$(AS) -f elf $(A20_SRC) -o $(A20_O)

$(GDT_O): $(GDT_SRC) | $(BIN)
	$(AS) -f elf $(GDT_SRC) -o $(GDT_O)

$(PM_O): $(PM_SRC) | $(BIN)
	$(AS) -f elf $(PM_SRC) -o $(PM_O)

$(BOOT2_O): $(BOOT_SRC) | $(BIN)
	$(AS) -f elf $(BOOT2_SRC) -o $(BOOT2_O)

$(BOOTC_O): $(BOOTC_SRC) | $(BIN)
	$(CC) $(CFLAGS) -I$(LIBK_INCLUDE) -c $(BOOTC_SRC) -o $(BOOTC_O)


$(BOOT2_ELF): $(BOOT2_O) $(A20_O) $(GDT_O) $(PM_O) $(BOOTC_O) $(KPRINTF_O) | $(ELF)
	$(LD) -T $(LINKER_BOOT_SCRIPT) $(BOOT2_O) $(A20_O) $(GDT_O) $(PM_O) $(BOOTC_O) $(KPRINTF_O) -o $(BOOT2_ELF)

$(BOOT2_BIN): $(BOOT2_ELF) | $(BIN)
	$(OBJCOPY) -O binary $(BOOT2_ELF) $(BOOT2_BIN)

$(BOOT_IMG): $(BOOT_BIN) $(BOOT2_BIN) | $(IMG)
	$(CAT) $(BOOT_BIN) $(BOOT2_BIN) > $(BOOT_IMG)
