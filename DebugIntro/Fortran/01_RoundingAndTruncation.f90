
MODULE KINDS

  !Constants for "single" and "double" precision floats
  INTEGER, PARAMETER :: real32 = KIND(1.0)
  INTEGER, PARAMETER :: real64 = KIND(1.0d0)

END MODULE KINDS


PROGRAM example

  USE KINDS

  IMPLICIT NONE

  INTEGER :: i, j, n
  REAL(KIND=real32) :: a = 3.0, b = 5.0, c
  REAL(KIND=real64) :: d = 3.14159265358979323846_real64
  !Note the _real64 wart which makes this a 64-bit literal
  CHARACTER(22) :: str = "3.14159265358979323846"
  REAL(KIND=real64) :: f, g


  i = a / b
  c = d

  PRINT*, "Floats are truncated to store into integers:"
  WRITE(*,fmt='(f6.3, a2, f6.3, a18, i0)')  a, ' /', b, "as an integer is ", i
  PRINT*, ''
  b = 2.0; i = a / b
  WRITE(*,fmt='(f6.3, a2, f6.3, a18, i0)')  a, ' /', b, "as an integer is ", i
  PRINT*, ''

  PRINT*, "All floats have limited precision:"
  WRITE(*, fmt='(a23, a15, f23.20, a23, f15.12)') str, &
      "as a double is", d, "and that as a float is", c

  f = 0.5; g = 0.01
  i = f/g
  WRITE(*, fmt='(f15.12, a2, f15.12, a29, i0)') f, '/', g, &
      "might not be 50! Here it is ", i

  PRINT*, ''
  PRINT*, &
      "Summing small numbers can give unexpected results due to finite precision:"

  f = 0.0
  n = 10000
  g = 1.0/n

  DO i = 1, n
    f = f + g
  ENDDO

  j = f
  WRITE(*, fmt='(f15.12, a8, i0, a10, f23.20, a15, i0)') g, "summed ", n, &
      "times is ", f, "and rounds to ", j

  j = 0; f = 0.0

  DO WHILE(f < 1.0)
    j = j + 1
    f = f + g
  ENDDO

  WRITE(*, fmt='(a7, f15.12, a34, i0, a28, i0)') "Using ", g, &
      "as a while loop increment we get ", j, " iterations where we expect ", n


END PROGRAM example
