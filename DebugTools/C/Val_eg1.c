#include <stdio.h>
#include <stdlib.h>


#define size 10

int main(int argc, char** argv){

  int * a = NULL;
  int i = 0;

  int * rand_ptr;

  a = malloc(size*sizeof(int));
  rand_ptr = &a[5];

  for(i = 0; i<= size; i++){
    a[i] = i;
    printf("%d %d\n", i, a[i]);
 }

  free(a);

  printf("Random pointer address: %p\n", (void*)rand_ptr);
  if(!rand_ptr) printf("******** Pointer is Null *******\n");
  printf("%d\n", (rand_ptr == NULL));
  printf("Random pointer data:  %d\n", *rand_ptr);
  printf("Done\n");
  return 0;
}
