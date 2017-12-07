

main : main.o helper.o
	cc -o main main.o helper.o
main.o : main.c helper.h
	cc -c main.c
helper.o : helper.c helper.h
	cc -c helper.c

#.PHONY : clean

clean:
	@rm *.o

