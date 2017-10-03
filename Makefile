all: main printAddresses shellcode

printAddresses: feckPrintAddresses.c
	gcc -g -zexecstack -fno-stack-protector -o printAddresses feckPrintAddresses.c

shellcode: shellcode.o
	ld shellcode.o -o shellcode

shellcode.o: shellcode.s
	as shellcode.s -o shellcode.o

main: fecklessauth.c 
	gcc -g -zexecstack -fno-stack-protector fecklessauth.c

