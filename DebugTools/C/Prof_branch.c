#include <stdio.h>
#include <time.h>

/*Adapted from
https://stackoverflow.com/questions/11227809/
why-is-it-faster-to-process-a-sorted-array-than-an-unsorted-array */

#define arraySize 32768

int main(int argc, char** argv){

    int data[arraySize];
    int i, j, iters = 1000;
    clock_t start, end;
    double time;
    long long sum = 0;


    for(i = 0; i < arraySize; ++i){
      data[i] = i;
    }

    start = clock();

    for (j = 0; j < iters; ++j){
        for (i = 0; i < arraySize; ++i){

#ifdef BR_1
            /*Alternate every other item */
            if ((data[i] & 2) == 0){
#elif BR_2
            /*Alternate more TFFFTFFF...*/
            if ((data[i] & 3) == 0){
#elif BR_3
            /*Always true */
            if ((data[i] & 0x80000000) == 0){
#else
            /*One style for start another for rest */
            if (data[i] >= arraySize/2){
#endif
                sum += data[i];
            }
        }
    }

    end = clock();
    printf("Elapsed time %f s\n", ((double) (end - start)) / CLOCKS_PER_SEC);

}
