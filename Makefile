OBJ = cJSON.o
LIBNAME = libcjson
TESTS = test

R_CFLAGS = -Wall -O1 -Werror -Wstrict-prototypes -Wwrite-strings -D_POSIX_C_SOURCE=200112L

STLIBNAME = $(LIBNAME).a

.PHONY: clean

$(STLIBNAME): $(OBJ)
		ar rcs $@ $<

all: $(STLIBNAME) $(TESTS)

$(OBJ): cJSON.c cJSON.h 

.c.o:
		$(CC) -c $(R_CFLAGS) $<

$(TESTS): cJSON.c cJSON.h test.c
		$(CC)  cJSON.c test.c -o test -lm -I.

clean: 
		rm -rf $(STLIBNAME) $(TESTS) *.o
