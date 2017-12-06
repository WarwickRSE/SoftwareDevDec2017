#include <stdio.h>
#include <math.h>
#include <time.h>
#include <stdlib.h>

#define size 100000

void fill_array(float* array, int array_size);
void show_array(float* array, int array_size);
void solve_array(float* array, int array_size);

void add_to_element(float* element, float increment);
void divide_element(float* element, float divisor);
void multiply_element(float* element, float multiplicand);


int main(int argc, char** argv){

  float * array;
  int i;
  int n_iter = 10000;
  array = malloc(size*sizeof(int));

  fill_array(array, size);

  for(i = 0; i < n_iter; i++){
    printf("%d\n", i);
    solve_array(array, size);
  }

  free(array);
  return 0;
}



void fill_array(float* array, int array_size){
/* Fill passed in array with random values. Array must have been allocated*/

  int i, j=0;
  srand(time(NULL));

  for(i = 0; i < array_size; i++){
    array[i] = (float)(rand()%10000) /30.0;
    if(array[i] > 100.0) j++;
  }
  printf("%d", j);
}

void show_array(float* array, int array_size){
/* Print array to terminal */

  int i;
  for(i = 0; i < array_size; i++){
    printf("%6.3f\t", array[i]);
  }

}

void output_array(float* array, int array_size, char* filename){
/* Print array to file of name */

  int i;
  FILE *fileptr;
  fileptr = fopen(filename, "w");

  for(i = 0; i < array_size; i++){
    fprintf(fileptr, "%6.3f\t", array[i]);
  }

  fclose(fileptr);

}


void solve_array(float* array, int array_size){
/* "Solve" the array. Here we just do some test operations, rather than
a useful algorithm
*/

  int i;
  float inc, div, recip_div;
  inc = 3.0;
  div = 2.0;
  recip_div = 1.0/div;
  for(i = 0; i < array_size; i++){

    add_to_element(array + i, inc);
    if(array[i] > 100.0) divide_element(array + i, div);
    /*if(array[i] > 100.0) multiply_element(array + i, recip_div);*/

  }

}

void add_to_element(float* element, float increment){

  *element += increment;
}

void divide_element(float* element, float divisor){

  *element /= divisor;

}

void multiply_element(float* element, float multiplicand){

  *element *= multiplicand;

}
