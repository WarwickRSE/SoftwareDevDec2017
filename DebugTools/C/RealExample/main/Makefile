VPATH = .:../support:../lib
main:serial

bugfree:serial_bugfree.c array.o display.o
	cc -g -I ../support -o serial_bugfree ../lib/array.o ../lib/display.o serial_bugfree.c

serial:serial.c array.o display.o
	cc -g -I ../support -o serial ../lib/array.o ../lib/display.o serial.c
array.o:array.c array.h
	cc -g -c -I ../support -o ../lib/array.o ../support/array.c
display.o:display.c display.h array.o
	cc -g -c -I ../support -o ../lib/display.o ../support/display.c
