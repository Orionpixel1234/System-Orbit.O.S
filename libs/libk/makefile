LIBK_SRC := libs/libk
KPRINTF_SRC ?= $(LIBK_SRC)/src/kprintf.c
KPRINTFH_SRC ?= $(LIBK_SRC)/include/kprintf.h
LIBK_INCLUDE ?= $(LIBK_SRC)/include

$(KPRINTF_O): $(KPRINTF_SRC) | $(BIN)
	$(CC) $(CFLAGS) -I$(LIBK_INCLUDE) -c $(KPRINTF_SRC) -o $(KPRINTF_O)
