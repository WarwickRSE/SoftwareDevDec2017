#include <stdio.h>
#include <float.h>
#include <stdlib.h>
#include <time.h>

#define size 16

int main(int argc, char** argv){

  int array[size];
  int array2[size];
  int i, r;
  char str[16]="abcdefghijklmnop";


#ifdef ARR
  /* Set all value to 0*/
  for(i = 0; i< size; i++){
    array[i] = 0;
    array2[i] = 0;
  }

  /* Randomly choose array or array2*/
  srand(time(NULL));
  r = rand()%2;
  if(r > 0){
    /* Fill array2 */
    for(i = 0; i< size+2; i++){
      array2[i] = i;
    }
  }else{
    /* Fill array */
    for(i = 0; i< size+4; i++){
      array[i] = i;
    }
  }

  /* View array*/
  printf("First array is:\n");
  for(i = 0; i< size; i++){
    printf("%d ", array[i]);
  }
  printf("\n");

 /* View array2 */
  printf("Second array is:\n");
  for(i = 0; i< size; i++){
    printf("%d ", array2[i]);
  }
  printf("\n");
#endif
#ifdef BUFF
  printf("%s\n", str);

#endif

}
