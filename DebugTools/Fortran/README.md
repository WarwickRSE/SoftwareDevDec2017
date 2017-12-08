Fortran90 example code and exercise sheet for Introduction to Debug Tools

Compile the examples with
  `gfortran -O0 -g {name} -o {outputname}`
For example
  `gfortran -O0 -g 09_Tarpit.f90 -o 09`

Remember the `-g`!

Note that some examples use an upper-case extension, `.F90`. This is important as it tells the compiler to use the pre-processor which lets us use the `#define` to control compilation. 

Run inside the debugger using `gdb ./09` or similar

The later examples also have working versions in the directory Solutions

Finally, there is a piece of "real" code in the RealExample directory. This also has bugs. Try and diagnose them.

