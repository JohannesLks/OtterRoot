CC ?= gcc
LIBMNL_DIR = $(realpath ./)/libmnl_build
LIBNFTNL_DIR = $(realpath ./)/libnftnl_build
exploit = exploit/exploit.c
CFLAGS = -w -static -Wall
LIBS = -L$(LIBMNL_DIR)/install/usr/local/lib -L$(LIBNFTNL_DIR)/install/usr/local/lib -lnftnl -lmnl -lpthread
INCLUDES = -I$(LIBMNL_DIR)/install/usr/local/include -I$(LIBNFTNL_DIR)/install/usr/local/include

all: exploit

exploit: $(exploit) $(LIBMNL_DIR) $(LIBNFTNL_DIR)
	$(CC) $(CFLAGS) $(exploit) -o PoC $(INCLUDES) $(LIBS) 


clean:
	rm -f exploit 

.PHONY: all exploit  clean
