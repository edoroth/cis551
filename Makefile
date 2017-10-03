all: main modified shellcode

modified: feckModified.c
	gcc -g -zexecstack -fno-stack-protector -o modified feckModified.c

shellocde: shellcode.o
	ld shellcode.o -o shellcode

shellcode.o: shellcode.s
	as shellcode.s -o shellcode.o

main: fecklessauth.c 
	gcc -g -zexecstack -fno-stack-protector fecklessauth.c

