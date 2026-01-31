LIBK_SRC := libs/libk
KPRINTV_SRC ?= $(LIBK_SRC)/src/kprintv.c
KPRINTVH_SRC ?= $(LIBK_SRC)/include/kprintv.h
LIBK_INCLUDE ?= $(LIBK_SRC)/include

$(KPRINTV_O): $(KPRINTV_SRC) | $(BIN)
	$(CC) $(CFLAGS) -I$(LIBK_INCLUDE) -c $(KPRINTV_SRC) -o $(KPRINTV_O)
