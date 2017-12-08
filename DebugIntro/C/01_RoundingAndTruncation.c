#include <stdio.h>
#include <float.h>


int main(int argc, char** argv){

  int i, j, n;
  float a = 3.0, b = 5.0, c;
  double d = 3.14159265358979323846;
  char *str = "3.14159265358979323846";
  double f, g;

  i = a/b;
  c = d;

  printf("Floats are truncated to store into integers:\n");
  printf("%f/%f as an integer is %d \n", a, b, i);

  b = 2.0; i = a/b;
  printf("%f/%f as an integer is %d \n", a, b, i);

  printf("\n");
  printf("All floats have limited precision:\n");

  printf("%s as a double is %23.20f and that as a float is %15.12f \n", str, d, c);

  f = 0.5; g=0.01;
  i = f/g;
  printf("%15.12f/%15.12f might not be 50! Here it is %d \n", f, g, i);

  printf("\nSumming small numbers can give unexpected results due to finite precision:\n");

  f = 0.0;
  n = 10000;
  g = 1.0/n;
  for(i=0; i < n; i++){
    f += g;
  }
  j = f;
  printf("%15.12f summed %d times is %23.20f and rounds to %d\n", g, n, f, j);

  j = 0; f = 0.0;
  while(f < 1.0){
    j++;
    f += g;
  }
  printf("Using %15.12f as a while loop increment we get %d iterations where we expect %d", g, j, n);


  printf("\n");

  return 0;

}

