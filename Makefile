CFLAGS=-std=c11 -g -static

11cc:
	gcc $(CFLAGS) -o bin/11cc main.c

test: 11cc
	./test.sh

clean:
	rm -rf bin/*
