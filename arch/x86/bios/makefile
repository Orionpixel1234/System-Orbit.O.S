BIOS_PATH := arch/x86/bios

BOOT_SRC ?= $(BIOS_PATH)/boot.asm
BOOT2_SRC ?= $(BIOS_PATH)/boot2.asm
LINKER_BOOT_SCRIPT ?= $(BIOS_PATH)/linker.ld

$(BOOT_BIN): $(BOOT_SRC) | $(BIN)
	$(AS) -f bin $(BOOT_SRC) -o $(BOOT_BIN)

$(BOOT2_O): $(BOOT_SRC) | $(BIN)
	$(AS) -f elf $(BOOT2_SRC) -o $(BOOT2_O)

$(BOOT2_ELF): $(BOOT2_O) | $(ELF)
	$(LD) -T $(LINKER_BOOT_SCRIPT) $(BOOT2_O) -o $(BOOT2_ELF) 

$(BOOT2_BIN): $(BOOT2_ELF) | $(BIN)
	$(OBJCOPY) -O binary $(BOOT2_ELF) $(BOOT2_BIN)

$(BOOT_IMG): $(BOOT_BIN) $(BOOT2_BIN) | $(IMG)
	$(CAT) $(BOOT_BIN) $(BOOT2_BIN) > $(BOOT_IMG)
