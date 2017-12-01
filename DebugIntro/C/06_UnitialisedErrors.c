#include <stdio.h>
#include <float.h>
#include <stdlib.h>
#include <time.h>

#define size 15

int main(int argc, char** argv){

  int * array, * array2;
  int i, new_size = 0;

  array = malloc(size*sizeof(int));
  for(i = 0; i< size; i++){
    array[i] = i;
  }
  printf("These values are set initially:\n");
  for(i = 0; i< size; i++){
    printf("%d ", array[i]);
  }
  printf("\n");
  free(array);

  if(argc > 1){
    new_size = atoi(argv[1]);
  }
  if(new_size <= 0) new_size = size;

  array2 = malloc(new_size*sizeof(int));

  array = malloc(size*sizeof(int));

  printf("\nThis is the array of size you requested, and should be junk:\n");
  for(i = 0; i< new_size; i++){
    printf("%d ", array2[i]);
  }
  printf("\n");

  printf("\nThis is another array, and should be junk:\n");

  for(i = 0; i< size; i++){
    printf("%d ", array[i]);
  }
  printf("\n");
  free(array);
  free(array2);

}
