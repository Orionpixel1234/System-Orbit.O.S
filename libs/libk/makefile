LIBK_SRC := libs/libk
KPRINTV_SRC ?= $(LIBK_SRC)/src/kprintv.c
STRING_SRC ?= $(LIBK_SRC)/src/string.c
LIBK_INCLUDE ?= $(LIBK_SRC)/include

$(KPRINTV_O): $(KPRINTV_SRC) | $(BIN)
	$(CC) $(CFLAGS) -I$(LIBK_INCLUDE) -c $(KPRINTV_SRC) -o $(KPRINTV_O)

$(STRING_O): $(STRING_SRC) | $(BIN)
	$(CC) $(CFLAGS) -I$(LIBK_INCLUDE) -c $(STRING_SRC) -o $(STRING_O)
