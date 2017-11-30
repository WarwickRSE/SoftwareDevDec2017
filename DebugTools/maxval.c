#include <stdio.h>
#include <float.h>
#include <time.h>

#define size 10
#define eg_float float
#define eg_float_max FLT_MAX

void fill_array(eg_float* array, int array_size);

eg_float maxval(eg_float* array, int array_sz);


int main(int argc, char** argv){

  int i = 0;
  eg_float array[size], max;

  fill_array(array, size);

  printf("Values to 3dp:");

  for(i=0; i<size; i++){
    printf("%6.3f\t", array[i]);
  }
  printf("\n");

  max = maxval(array, size);

  printf("Max is: %f\n", max);

}

eg_float maxval(eg_float* array, int array_sz){

  int i = 0;
  eg_float max = -eg_float_max;

  for(i=0; i<array_sz; i++){
    if(array[i] > max) max = array[i];

  }
  return max;
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
    array[i] = (rand()%10000)/3000.0;
  }
}

