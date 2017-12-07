
CC=cc

VAR1 = abc
VAR2 = $(VAR1)  #Set to equal VAR1
VAR3 := $(VAR1) #Set to value of VAR1
VAR1 = def

$(info VAR2 is $(VAR2))
$(info VAR3 is $(VAR3))


main : main.o helper.o
	$(CC) -o main main.o helper.o
main.o : main.c helper.h
	$(CC) -c main.c
helper.o : helper.c helper.h
	$(CC) -c helper.c

.PHONY : clean

clean:
	@rm *.o

