Fortran90 example code and exercise sheet for Introductory Debugging

Compile the examples with
  `gfortran -O0 -g {name} -o {outputname}`
For example
  `gfortran -O0 -g 09_Tarpit.f90 -o 09`

Note that some examples use an upper-case extension, `.F90`. This is important as it tells the compiler to use the pre-processor which lets us use the `#define` to control compilation. 

There is also a program 03-05\_InfAndNaNTable. This generates a table of IEEE arithmetic combinations
The code uses old-style VT100 codes to colour the output: if this doesn't work it can be disabled by compiling with -DNO\_C
The code itself uses some odd newer Fortran for compactness.
A coloured version of the output is included in the parent directory for reference.
