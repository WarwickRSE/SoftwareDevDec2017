#include <stdio.h>


int main(int argc, char** argv){


  int * ptr;

  ptr = (int*)0x0FFFFF;
  printf("Pointer is %p\n", (void*)ptr);
  printf("Pointer points to\n");
  printf("%d\n", *ptr);

}
