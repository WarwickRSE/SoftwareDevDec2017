Fortran90 example code and exercise sheet for Introductory Debugging

Compile the examples with
  `gfortran -O0 -g {name} -o {outputname}`
For example
  `gfortran -O0 -g 09_Tarpit.f90 -o 09`

Note that some examples use an upper-case extension, `.F90`. This is important as it tells the compiler to use the pre-processor which lets us use the `#define` to control compilation. 

See the C directory for a table of Inf, NaN and signed-zero operations. 
The code is rather terse, so don't worry if you don't understand it all. A coloured version of the output is included in the parent directory for reference.
