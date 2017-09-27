all: main modified

modified: feckModified.c
	gcc -o modified feckModified.c

main: feckless.c
	gcc -g feckless.c
