#include <stdio.h>
#include <float.h>
#include <time.h>

#define size 10
#define IRANGE 1000
#define eg_int int
#define eg_float float

void fill_array(eg_int* array, int array_size);

void fill_array_exp(eg_int* array, int array_size);

int main(int argc, char** argv){

  int i = 0;
  eg_int array[size], spacing, product;
  eg_float value_as_float, incremented_value;

  fill_array(array, size);

  printf("Random values from 0 to %d: ", IRANGE);

  for(i=0; i<size; i++){
    printf("%d\t", array[i]);
  }
  printf("\n");

  product = 1;
  for(i=0; i<size; i++){
   printf("%d \ttimes \t%d \tis %d\n", product, array[i], product*array[i]);
   product *= array[i];
  }

  fill_array_exp(array, size);

  printf("\n");
  printf("Random values of generally increasing size: ");

  for(i=0; i<size; i++){
    printf("%d\t", array[i]);
  }
  printf("\n");
  printf("\n");


  printf("Now print the value (float) value+1 - (float) value\n");
  for(i=0; i<size; i++){
    value_as_float = (eg_float) array[i];
    incremented_value = value_as_float + 1;
    spacing = incremented_value - value_as_float;
    printf("%d\t", spacing);
  }

  printf("\n");



}

void fill_array(eg_int* array, int array_size){

  int i;

#  ifndef DEBUG
  srand(time(NULL)); /*Init RNG with current time*/
#  else
  srand(1287);/*Use a fixed seed */
#  endif

  /*Fill array with random values.
  For simplicity use rand / 100 */

  for(i=0; i< array_size; i++){
    array[i] = rand()%IRANGE;
  }
}

void fill_array_exp(eg_int* array, int array_size){

  int i;
  int range = 1000;

#  ifndef DEBUG
  srand(time(NULL)); /*Init RNG with current time*/
#  else
  srand(1287);/*Use a fixed seed */
#  endif

  /*Fill array with random values.
  For simplicity use rand / 100 */

  for(i=0; i< array_size; i++){
    array[i] = rand()%range;
    range *= 100;
  }
}

