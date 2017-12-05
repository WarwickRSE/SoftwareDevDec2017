
MODULE KINDS

  !Constants for "single" and "double" precision floats
  INTEGER, PARAMETER :: real32 = KIND(1.0)
  INTEGER, PARAMETER :: real64 = KIND(1.0d0)

END MODULE KINDS


PROGRAM MAIN

  USE KINDS

  INTEGER :: i = 0
  INTEGER :: j = HUGE(1), k = -HUGE(1) - 1
  REAL(KIND=real32) :: a = TINY(1.0_real32), b = HUGE(1.0_real32), bb
  REAL(KIND=real64) :: c = TINY(1.0_real64), d = HUGE(1.0_real64)

  WRITE(*, fmt='(a41, i0, a10, i0)') "A normal 4 byte integer must be between ", &
      k, "and HUGE ", j
  WRITE(*, fmt='(a21, i0, a7, i0)') "Adding one to HUGE: ", j,"+ 1 = ", j + 1
  WRITE(*, fmt='(a33, i0, a7, i0)') "Subtracting one from -(HUGE+1): ", &
      k,"- 1 = ", k - 1

  PRINT*, ''
  PRINT*, "Floating point numbers also have limits."

  WRITE(*, fmt='(a27, e12.6, a5, e12.6)') "The min and max float are ", a, " and ", b


  bb = b * 1.1
  WRITE(*, fmt='(a15, e12.6)') "HUGE * 1.1 is ", bb

  bb = b  + 1
  PRINT*, "Bonus: the following is unexpected! See first note."
  WRITE(*, fmt='(a15, e12.6)') "HUGE + 1.1 is ", bb


  PRINT*, "Bonus: the following is unexpected! See second note."
  bb = a /1.1
  WRITE(*, fmt='(a15, e12.6)') "TINY / 1.1 is ", bb


END PROGRAM MAIN
