#include <stdio.h>
#include <limits.h>
#include <float.h>

float add(float a, float b);
float sub(float a, float b);
float mul(float a, float b);
float div(float a, float b);

int main(int argc, char** argv){

  float min = FLT_MIN, max = FLT_MAX;
  float isNaN = 0.0/0.0;
  float isInf = FLT_MAX *2, negInf = 1.0/-0.0;
  float zero = 0.0, negZero = -0.0;
  float row;

  int rowNum, opNum;

  float allRows[7];
  float (*op)(float, float);/*Holds operation function*/
  float(*allOps[4])(float, float);
  char opSymbols[4] = {'+', '-', '*', '/'};

  allRows[0] = negInf; allRows[1] = -1;allRows[2] = negZero; allRows[3] = 0.0;
  allRows[4] = 1.0; allRows[5]=isInf; allRows[6] = isNaN;

  allOps[0] = &add; allOps[1] = &sub; allOps[2] = &mul; allOps[3] = &div;

  printf("IEEE Standards for Inf and Nan Arithmetic:\n");
  printf("Left operand is in the column, right along the top\n");

  for(opNum=0.0; opNum< 4; opNum++){
    op = allOps[opNum];
    printf("%c\t%f\t-1.0\t%3.1f\t0.0\t1.0\t%f\t%f\n", opSymbols[opNum],negInf, negZero, isInf, isNaN);

    for(rowNum = 0; rowNum < 7; rowNum++){
      row = allRows[rowNum];
      printf("%3.1f\t%3.1f\t%3.1f\t", row, (float)op(row,negInf), op(row,-1.0)) ;
      printf("%3.1f\t%3.1f\t", op(row,negZero), op(row,zero));
      printf("%3.1f\t%3.1f\t%3.1f\n", op(row,1.0), op(row,isInf), op(row,isNaN));
    }
   printf("____________________________________________________________\n");
   printf("\n");

  }
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


