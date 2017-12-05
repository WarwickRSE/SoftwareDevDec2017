#include <stdio.h>
#include <float.h>
#include <time.h>
#include <limits.h>
#include <float.h>

int main(int argc, char** argv){

  int i = 0;
  int j = INT_MAX, k = INT_MIN;
  int l = UINT_MAX;

  float a = FLT_MIN, b = FLT_MAX, bb;
  double c = DBL_MIN, d = DBL_MAX;

  printf("A normal 4 byte integer must be between INT_MIN of %d and INT_MAX of %d\n", k, j);
  printf("Adding one to INT_MAX: %d + 1 = %d\n", j, j+1);
  printf("Subtracting one from INT_MIN: %d - 1 = %d\n", k, k-1);

  printf("\n");

  printf("C also has unsigned integers which are between %d and %u\n", i, l);
  printf("Adding one to UINT_MAX is undefined behaviour!\n");
  printf("Here it is: %u + 1 = %u \n", l, l+1);
  printf("\n");
  printf("Bonus points: what is this line doing? %u = %d\n", l, l);

  printf("\n");

  printf("Floating point numbers also have limits.\n");
  printf("The min and max float are %10.6e and %10.6e\n", a, b);

  bb = b * 1.1;
  printf("FLT_MAX * 1.1 is %10.6e\n", bb);

  printf("Bonus: the following is unexpected! See first note.");
  bb = b + 1.0;
  printf("FLT_MAX + 1 is %10.6e\n", bb);


  printf("Bonus: the following is unexpected! See second note.");
  bb = a /1.1;
  printf("FLT_MIN / 1.1 is %10.6e\n", bb);


}
