#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define size 10

int * fill_array(int * array, int array_sz);
void f_wait(int sec);

int main(int argc, char** argv){

  int * a = NULL;
  int i = 0, j = 0;

  a = fill_array(a, size);

  for(i = 0; i < 5; i++){
    f_wait(1);
    for(j = 0; j < size; j++){
      printf("%d\t", a[j]);
    }
    printf("\n");
    fill_array(a, size);
  }
  free(a);
  return 0;
}

int* fill_array(int* array, int array_size){

  int i;

  array = malloc(array_size*sizeof(int));
#ifdef NORAND
  for(i=0; i< array_size; i++){
    array[i] = i;
  }
#endif
#ifndef NORAND

#  ifndef DEBUG
  srand(time(NULL)); /*Init RNG with current time*/
#  else
  srand(1287);/*Use a fixed seed */
#  endif

  /*Fill array with increasing values jumping either 1 or 2*/
  array[0] = rand()%4;
  for(i=1; i< array_size; i++){
    array[i] = array[i-1] + 1 + rand()%2;
  }

#endif
  return array;
}

void f_wait(int sec){
/* Wait for sec seconds, burning CPU all the while*/

  time_t init = time(NULL);
  time_t final = init;

  while(final < init+sec){
    final = time(NULL);
  }
}

