#include <stdio.h>
#include <stdlib.h>

int main(int argc, char** argv){

  int * a = NULL;
  int i = 0;

  /*a = malloc(10*sizeof(int));*/

  for(i = 0; i<= 10; i++){
    a[i] = 0;
    printf("%d\n", a[i]);
 }

  return 0;
}
