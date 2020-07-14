EXEC	= testSound1
OBJECTS1	= testSound1.o
CFLAGS	= -Wall -Wextra -Werror -Wpedantic -std=c99 -g
CC	= clang -g

.PHONY: all clean

all: $(EXEC)

testSound1	: $(OBJECTS1)
		$(CC) -o testSound1 $(OBJECTS1) -lm

testSound1.o	: testSound1.c
		$(CC) -c testSound1.c

clean	:
	        rm -f $(EXEC) $(OBJECTS1)

infer	:
	        make clean; infer-capture -- make; infer-analyze -- make

format	:
	        clang-format -i -style=file *.c *.h
formatc	:
	        clang-format -i -style=file *.c
formath	:
	        clang-format -i -style=file *.h
valgrind:
	        valgrind testSound1;
