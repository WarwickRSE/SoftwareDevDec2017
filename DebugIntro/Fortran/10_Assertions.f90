
MODULE ASSERTS

  CONTAINS
  SUBROUTINE ASSERT(condition)
    LOGICAL, INTENT(IN) :: condition
    INTEGER:: x, y
    y = 0
   IF( .NOT. condition) THEN
 !    x = 1/y !Create error to force bad exit
     STOP "Assert"
   ENDIF
  END SUBROUTINE

END MODULE ASSERTS

MODULE HELPERS
  USE ASSERTS
  CONTAINS
  FUNCTION power(x, n)
    REAL :: x, power
    INTEGER :: n, i

    CALL ASSERT((n .GT. 0))

    power = x
    DO i = 1, n
      power = power * x
    ENDDO

  END FUNCTION

END MODULE HELPERS

PROGRAM example

  USE ASSERTS
  USE HELPERS
  IMPLICIT NONE

  INTEGER :: n
  REAL :: x

  PRINT*, "Fortran has no Assert, but we can create something similar"

  x = 2.0; n = 2
  WRITE(*, fmt='(f6.3, a, i0, a, f6.3)') x, ' to the power ', n, &
      " is ", power(x, n)
  PRINT*, ''
  x = -2.0; n = 2
  WRITE(*, fmt='(f6.3, a, i0, a, f6.3)') x, ' to the power ', n, &
      " is ", power(x, n)
  PRINT*, ''
  x = 1.0; n = 1
  WRITE(*, fmt='(f6.3, a, i0, a, f6.3)') x, ' to the power ', n, &
      " is ", power(x, n)
  PRINT*, ''
  x = 2.0; n = -2
  WRITE(*, fmt='(f6.3, a, i0, a, f6.3)') x, ' to the power ', n, &
      " is ", power(x, n)
  PRINT*, ''




END PROGRAM example
