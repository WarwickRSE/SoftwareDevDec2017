#include <stdio.h>
#include <stdlib.h>
#include <float.h>
#include <time.h>

#define size 10
#define eg_float float

void fill_array(eg_float* array, int array_size);

double sum(eg_float* array, int array_sz);

float sum_as_float(eg_float* array, int array_sz);

eg_float sum_onto_value(eg_float* array, int array_sz, eg_float init_value);

int main(int argc, char** argv){

  int i = 0;
  eg_float array[size];
  double sum_d;
  float sum_f;
  eg_float sum_onto, init = 2.34642e5;

  fill_array(array, size);

  printf("Array of %d random values, printed to 3dp:\n", size);

  for(i=0; i<size; i++){
    printf("%6.3f\t", array[i]);
  }
  printf("\n");

  sum_d = sum(array, size);
  sum_f = sum_as_float(array, size);

  printf("\n");

  printf("Summed as floats (32bit) %12.10f and as double (64bit) %12.10f\n", sum_d, sum_f);
  printf("Difference is: %10.6e\n", sum_d-sum_f);

  sum_onto = sum_onto_value(array, size, init);

  printf("\n");


  printf("Starting with %10.6e and adding on the array values gives: %10.6e\n", init, sum_onto);
  printf("This gives an error of %10.6e in the sum\n",
     (sum_onto-init)-sum_f);
  /* If you change the define to double type, change the line above to use sum_d*/

  return 0;
}

double sum(eg_float* array, int array_sz){

  int i;
  double sum = 0.0;
  for(i=0; i< array_sz; i++){
    sum = sum + array[i];
  }
  return sum;
}

float sum_as_float(eg_float* array, int array_sz){

  int i;
  float sum = 0.0;
  for(i=0; i< array_sz; i++){
    sum = sum + (float)array[i];
  }
  return sum;
}

eg_float sum_onto_value(eg_float* array, int array_sz, eg_float init_value){
  /* Sums the given values along with the provided init value*/

  int i;
  eg_float sum = init_value;
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
    array[i] = (rand()%10000)/3000.0;
  }
}

