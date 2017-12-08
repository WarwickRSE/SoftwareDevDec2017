
MODULE HELPERS
  IMPLICIT NONE
  CONTAINS

  FUNCTION my_isNaN(input)
    REAL :: input
    LOGICAL :: my_isNaN
    my_isNaN = .FALSE.

  END FUNCTION my_isNaN
END MODULE HELPERS

PROGRAM MAIN

  !This lets us get a NaN value without the compiler complaining
  USE, INTRINSIC :: IEEE_ARITHMETIC, ONLY: IEEE_VALUE, IEEE_QUIET_NAN

  INTEGER, PARAMETER :: sz = 12
  REAL :: isNaN
  REAL :: a = 3.0
  REAL, DIMENSION(sz) :: array, new_array
  INTEGER :: i = 0, j = 0
  isNaN = IEEE_VALUE(1e0, IEEE_QUIET_NAN)

  PRINT*, "NaN (not a number) occurs from operations like 0.0/0.0 or sqrt(-1)"
  PRINT*, "NaN is contagious: any calculation with it gives NaN"

  WRITE(*, fmt='(f4.1, a3, f4.0, a3, f4.0)') a, "+ ", isNaN, "= ",a + isNan
  WRITE(*, fmt='(f4.1, a3, f4.0, a3, f4.0)') a, "* ", isNaN, "= ",a * isNan

  DO i = 1, sz
    array(i) = i * 20.0
  ENDDO

  PRINT*, ''
  PRINT*, "This means it can spread. This array is updated", &
    "by summing each element with its neighbours"
  array(sz/2) = isNan

  DO j = 1, 6
    WRITE(*, fmt='(a6, i0)') "Iter ", j
    WRITE(*, fmt='(12f6.1)') array
    PRINT*, ''

    DO i = 2, sz-1
      new_array(i) = (array(i-1) + array(i) + array(i+1))/3.0
    ENDDO
    DO i = 2, sz-1
      array(i) = new_array(i)
    ENDDO

  ENDDO

  PRINT*, ''
  PRINT*, ''

  PRINT*, "NaN is also special in comparisons: it is not equal to anything, even itself."

  WRITE(*, fmt='(f4.0, a4, f4.0, a4, l1)') isNaN, "== ", isNaN, "=> ", isNaN == isNaN
  WRITE(*, fmt='(f4.0, a4, f4.0, a4, l1)') isNaN, "< ", isNaN, "=> ", isNaN < isNaN
  WRITE(*, fmt='(f4.0, a4, f4.0, a4, l1)') isNaN, "> ", isNaN, "=> ", isNaN > isNaN


END PROGRAM MAIN


