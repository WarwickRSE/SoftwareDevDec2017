
# Set compiler name
cc = cc 

#Set phony targets
.PHONY : clean 

#Default rule
code : test.o
	$(cc) -o code test.o
#Pattern for compiling .c files
%.o : %.c
	$(cc) -c $<

#List the dependencies of test.o here
#It will be built with the rule above
test.o : test.c 
#Clean rule
clean:
	@rm -rf code
	@rm -rf *.o