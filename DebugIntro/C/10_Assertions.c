#include <stdio.h>
#include <assert.h>

float power(float x, int n);

int main(int argc, char** argv){

  int n;
  float x;

  printf("C provides an assert macro in assert.h\n");

  x = 2.0; n = 2;
  printf("\n%f to the power %d is %f\n", x, n, power(x, n));

  x = -2.0; n = 2;
  printf("\n%f to the power %d is %f\n", x, n, power(x, n));

  x = 1.0; n = 1;
  printf("\n%f to the power %d is %f\n", x, n, power(x, n));

  x = 2.0; n = -1;
  printf("\n%f to the power %d is %f\n", x, n, power(x, n));

  return 0;
}

float power(float x, int n){
/* Calculate x^n for +ve integer n*/

  int i;
  float result;
  assert(n > 0);

  result = x;
  for(i = 1; i < n; i++) result *= x;
  return result;

}
