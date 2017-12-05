
MODULE KINDS

  !Constants for "single" and "double" precision floats
  INTEGER, PARAMETER :: real32 = KIND(1.0)
  INTEGER, PARAMETER :: real64 = KIND(1.0d0)

END MODULE KINDS


PROGRAM MAIN

  USE KINDS

  REAL(KIND=real32) tempInC, tempInF, correctTempInF

  PRINT*, "Mixed Mode arithmetic (using a mix of float and integer) is risky!"
  PRINT*, ''
  PRINT*, "This temperature conversion program shows a common mistake:"

  tempInC = 18.0
  tempInF = 9/5 * tempInC + 32
  correctTempInF = 9.0/5.0 * tempInC + 32.0


  WRITE(*, fmt='(a1, f4.1, a6, f4.1, a3)') ' ', tempInC, " C is ", tempInF, "F ?"
  WRITE(*, fmt='(a19, f4.1, a2)') "Correct answer is ", correctTempInF, "F"

END PROGRAM MAIN


