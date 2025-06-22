CC ?= gcc

# Debug build flags
CFLAGS  = -g3 -O0 -Wall -Wextra -fsanitize=address -fno-omit-frame-pointer -DDEBUG_OTTER \
          $(shell pkg-config --cflags libmnl libnftnl)
LDFLAGS = -fsanitize=address $(shell pkg-config --libs libmnl libnftnl) -lpthread

SRC_DEBUG = exploit/exploit_dbg.c
BIN_DEBUG = PoC_dbg

# Release build flags
CFLAGS_REL  = -O2 -pipe -static $(shell pkg-config --cflags libmnl libnftnl)
LDFLAGS_REL = -static $(shell pkg-config --libs libmnl libnftnl) -lpthread
BIN_REL    = PoC

.PHONY: all debug release run strip clean

all: debug

debug: $(BIN_DEBUG)

$(BIN_DEBUG): $(SRC_DEBUG)
	$(CC) $(CFLAGS) $^ -o $@ $(LDFLAGS)

release: $(BIN_REL)

$(BIN_REL): exploit/exploit.c
	$(CC) $(CFLAGS_REL) $^ -o $@ $(LDFLAGS_REL)

run: $(BIN_DEBUG)
	ASAN_OPTIONS=detect_leaks=0:halt_on_error=1 ./$(BIN_DEBUG)

# Alias for release build
strip: release

clean:
	rm -f $(BIN_DEBUG) $(BIN_REL)
