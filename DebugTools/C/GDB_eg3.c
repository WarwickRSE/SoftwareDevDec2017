#include <stdio.h>
#include <math.h>

float my_sqrt(float input);
float get_x(int index);

int main(int argc, char** argv){

  int i = 0;
  float x = 9.0;
  float sqrt_x;

  for(i = 0; i < 5; i++){
    x = get_x(i);
    sqrt_x = my_sqrt(x);

    printf("%f %f\n", x, sqrt_x);
  }
  x = -9.0;
  sqrt_x = my_sqrt(x);

  printf("%f\n", sqrt_x);

}

float my_sqrt(float input){
  //Wraps sqrt so we can check our inputs

  return sqrt(input);

}

float get_x(int index){

  return (float) ((10*index)%7 - 3); //Will vary between +ve and -ve

}


