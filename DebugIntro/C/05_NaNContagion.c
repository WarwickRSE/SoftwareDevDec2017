#include <stdio.h>

#define size 12

int isNaN(float input);

int main(int argc, char** argv){

  float isNaN = 0.0/0.0;
  float a = 3.0;
  float array[size], new_array[size];
  int i = 0, j = 0;

  printf("NaN (not a number) occurs from operations like 0.0/0.0 or sqrt(-1)\n");
  printf("NaN is contagious: any calculation with it gives NaN\n");

  printf("%f + %f = %f\n", a, isNaN, a + isNaN);
  printf("%f * %f = %f\n", a, isNaN, a * isNaN);

  for(i = 0; i < size; i++){
    array[i] = i * 2.0;
  }
  printf("\n This means it can spread. This array is updated by summing each element with its neighbours\n");
  array[size/2] = isNaN;
  for(j = 0; j < 6; j++){
    printf("Iter %d\t", j);
    for(i = 0; i < size; i++){
      printf("%4.1f\t", array[i]);
    }
    printf("\n");
    for(i = 1; i < size-1; i++){
      new_array[i] = (array[i-1]+array[i] + array[i+1])/3.0;
    }
    for(i = 1; i < size-1; i++){
      array[i] = new_array[i];
    }
  }
  printf("\n\n");
  printf("NaN is also special in comparisons: it is not equal to anything, even itself.\n");

  printf("%f == %f => %d\n", isNaN, isNaN, isNaN == isNaN);
  printf("%f < %f => %d\n", isNaN, isNaN, isNaN < isNaN);
  printf("%f > %f => %d\n", isNaN, isNaN, isNaN > isNaN);

}

int isNaN(float input){

  return 0;
}
