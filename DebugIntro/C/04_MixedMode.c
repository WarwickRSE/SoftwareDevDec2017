#include <stdio.h>
#include <float.h>


int main(int argc, char** argv){

  float tempInC, tempInF, correctTempInF;

  printf("Mixed Mode arithmetic (using a mix of float and integer) is risky!\n");
  printf("\n");

  printf("This temperature conversion program shows a common mistake:\n");

  tempInC = 18.0;
  tempInF = 9/5 * tempInC + 32;
  correctTempInF = 9.0/5.0 * tempInC + 32.0;

  printf("%4.1f C is %4.1f F?\n", tempInC, tempInF);
  printf("Correct answer is %4.1f F\n", correctTempInF);

  return 0;
}

