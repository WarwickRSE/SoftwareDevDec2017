#include <stdio.h>
#include <float.h>
#include <stdlib.h>
#include <time.h>


int main(int argc, char** argv){


  int * ptr;

  ptr = 0x0FFFFF;
  printf("Pointer is %p\n", ptr);
  printf("Pointer points to\n");
  printf("%d\n", *ptr);

}
