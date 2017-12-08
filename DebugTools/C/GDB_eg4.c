#include <stdio.h>
#include <math.h>
#include <time.h>
#include <stdlib.h>

#define size 17

int get_index_of_value(int* array, int array_size, int value);
void fill_array(int* array, int array_size);

int main(int argc, char** argv){

  int array[size-1];
  int i=-1, target;
  unsigned int index = 0;

  fill_array(array, size);

  printf("pos\n");
  for(i=0; i<size; i++){
    printf("%d\t", i);
  }
  printf("\nval\n");

  for(i=0; i<size; i++){
    printf("%d\t", array[i]);
  }
  printf("\n");

  target = size/2; /* Default target*/
  if(argc > 1) target = atoi(argv[1]);
  /*Remember about checking inputs!*/

  printf("Target is: %d\n", target);
  index = get_index_of_value(array, size, target);
  if(index >= 0){
    printf("Found at position %d\n", index);
  }else{
    printf("Value not found\n");
  }
  return 0;
}

void fill_array(int* array, int array_size){

  int i;

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
}

int get_index_of_value(int* array, int array_size, int target){
/*This is an iterative version, using a loop with early break*/

  int stride;
  int i, centre;
  int lower=1, upper=array_size;

  stride = array_size/2;
  centre = array_size/2;

  for(i=0; i<array_size-1; i++){
    /*Actually need log_2(array_size) but size-1 is strict upper bound
      and our early break will always take care of the termination
    */
#ifdef DEBUG
    printf("Iteration: %d ", i);
    printf("Stride %d, centre %d\n", stride, array[centre]);
    printf("Lower %d, upper %d\n", lower, upper);
    for(j = lower; j< upper; j++){
      printf("%d ", array[j]);
    }
    printf("\n");
#endif
    if(array[centre] > target){
      upper = upper - stride;
      centre = (lower + upper)/2;
      stride = (upper - lower)/2;;
    }else if(array[centre] < target){
      lower = lower + stride;
      centre = (lower + upper)/2;
      stride = (upper - lower)/2;
    }else{
      stride = 0;
    }
    if(stride < 1){
      if(array[centre] == target){
        return centre;
      }else{
        return -1;
      }
    }
  }
  /*Should never be reached*/
  return -1000;
}

