#include <stdio.h>
#include <float.h>
#include <time.h>
#include <stdlib.h>

#define size 10
#define eg_float float

void fill_array(eg_float* array, int array_size);

eg_float sum(eg_float* array, int array_sz);

int main(int argc, char** argv){

  int i = 0;
  eg_float array[size];
  eg_float sum_a = 0, sum_last = 0;
  int k = 0;

  fill_array(array, size);

  printf("Values to 3dp:");

  for(i=0; i<size; i++){
    printf("%6.3f\t", array[i]);
  }
  printf("\n");

  for(i=0; i<5; i++){
    sum_a = sum(array, size);
    printf("\n");
    /*printf("%10.3f", sum_a);*/
    /* Check sum is the same every time*/
    if(i > 0 && sum_a != sum_last) k++;
    printf("%d", k);
    sum_last = sum_a;
  }

}

eg_float sum(eg_float* array, int array_sz){

  int i;
  eg_float sum;
  for(i=0; i< array_sz; i++){
    sum = sum + array[i];
  }
  return sum;
}

void fill_array(eg_float* array, int array_size){

  int i;

#  ifndef DEBUG
  srand(time(NULL)); /*Init RNG with current time*/
#  else
  srand(1287);/*Use a fixed seed */
#  endif

  /*Fill array with random values.
  For simplicity use rand / 100 */

  for(i=0; i< array_size; i++){
    array[i] = (rand()%10000)/30.0;
  }
}

