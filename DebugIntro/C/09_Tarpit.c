#include <stdio.h>
#include <float.h>
#include <time.h>
#include <string.h>

int main(int argc, char** argv){

  int i;
  const int reps = 1000;
  FILE *fileptr;
  clock_t start, end;
  int quiet = 0;

  if(argc > 1){
    if(strcmp(argv[1], "-q")) quiet = 1;
  }


 /* Opening once for write truncates any content*/
  fileptr = fopen("./tmp.out", "w");
  fclose(fileptr);
  start = clock();

#ifndef FIX
  for(i = 0; i< reps; i++){
    if(quiet) printf("%d\n", i);
    fileptr = fopen("./tmp.out", "a");
    fprintf(fileptr, "%d ", i);
    fclose(fileptr);
  }
#else
  fileptr = fopen("./tmp.out", "a");
  for(i = 0; i< reps; i++){
    if(quiet) printf("%d\n", i);
    fprintf(fileptr, "%d ", i);
  }
  fclose(fileptr);

#endif

  end = clock();
  printf("Elapsed time %f s\n", ((double) (end - start)) / CLOCKS_PER_SEC);

}
