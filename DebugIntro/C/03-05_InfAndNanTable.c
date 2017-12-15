#include <stdio.h>
#include <limits.h>
#include <float.h>

float add(float a, float b);
float sub(float a, float b);
float mul(float a, float b);
float div(float a, float b);

void Wbold();
void Unbold();
void Wcolour(float val);

int main(int argc, char** argv){

  float min = FLT_MIN, max = FLT_MAX;
  float isNaN = 0.0/0.0;
  float isInf = FLT_MAX *2, negInf = 1.0/-0.0;
  float zero = 0.0, negZero = -0.0;
  float row;

  int rowNum, opNum, colNum;

  float allRows[7];
  float (*op)(float, float);/*Holds operation function*/
  float(*allOps[4])(float, float);
  char opSymbols[4] = {'+', '-', '*', '/'};


  allRows[0] = negInf; allRows[1] = -1;allRows[2] = negZero; allRows[3] = 0.0;
  allRows[4] = 1.0; allRows[5]=isInf; allRows[6] = isNaN;

  allOps[0] = &add; allOps[1] = &sub; allOps[2] = &mul; allOps[3] = &div;

  printf("IEEE Standards for Inf and Nan Arithmetic:\n");
  printf("Left operand is in the column, right along the top\n");
  Wbold();
  for(opNum=0.0; opNum< 4; opNum++){
    op = allOps[opNum];
    printf("%c\t", opSymbols[opNum]);
    for(rowNum = 0; rowNum < 7; rowNum ++) Wcolour(allRows[rowNum]);
    printf("\n");

    for(rowNum = 0; rowNum < 7; rowNum++){
      row = allRows[rowNum];

      Wcolour(row);
      for(colNum = 0; colNum < 7; colNum++) Wcolour(op(row, allRows[colNum]));
      printf("\n");
    }
   printf("____________________________________________________________\n");
   printf("\n");

  }
  Unbold();
  return 0;
}

float add(float a, float b){
  return a + b;
}
float sub(float a, float b){
  return a - b;
}
float mul(float a, float b){
  return a * b;
}
float div(float a, float b){
  return a / b;
}

void Wcolour(float val){
/* Prints val with a color escape code
Uses VT100 color codes
NO_C turns this off
Includes a trailing TAB
*/

  float NaN = 0.0/0.0;
  float Inf = 1.0/0.0;

#ifndef NO_C
  if(val != val){
    /*NaN case is green bg */
    printf("%s", "\033[42m");
    printf("%s", "\033[30m");
  }else if(val == Inf){
    /*Inf is Blue on Cyan */
    printf("%s", "\033[44m");
    printf("%s", "\033[36m");
  }else if(val == -Inf){
    /* - Inf is cyan on blue */
    printf("%s", "\033[34m");
    printf("%s", "\033[46m");
  }else if ( val == 0.0 && (*(int*)&val >> 31) & 1 ){
    /* Neg zero is white on red */
    printf("%s", "\033[37m");
    printf("%s", "\033[41m");
  }else if (val == 0.0){
    /* Zero is red on white */
    printf("%s", "\033[47m");
    printf("%s", "\033[31m");
  }

/* Seems like VT100 escapes do take up space. If fg anf bg
aren't both set then the resetting below changes the tab stops
Easiest to change both*/

#endif
  printf("%3.1f", val);
  printf(" \t");

#ifndef NO_C
  printf("%s", "\033[39m");
  printf("%s", "\033[49m");
#endif
}

void Wbold(){
#ifndef NO_C
  printf("%s\n", "\033[1m");
#endif
}
void Unbold(){
#ifndef NO_C
  printf("%s", "\033[0m");
#endif
}
