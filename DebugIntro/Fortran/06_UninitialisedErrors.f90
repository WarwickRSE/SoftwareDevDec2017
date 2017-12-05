
MODULE KINDS

  !Constants for "single" and "double" precision floats
  INTEGER, PARAMETER :: real32 = KIND(1.0)
  INTEGER, PARAMETER :: real64 = KIND(1.0d0)

END MODULE KINDS

MODULE helpers

CONTAINS
FUNCTION total(array)
  IMPLICIT NONE
  INTEGER, DIMENSION(:), INTENT(IN) :: array
  INTEGER :: total
  INTEGER, DIMENSION(1) :: n_els
  INTEGER :: running_total = 0, i

  n_els = SHAPE(array)
  DO i = 1, n_els(1)
    running_total = running_total + array(i)
  ENDDO
  total = running_total

END FUNCTION total

END MODULE helpers

PROGRAM MAIN

  USE KINDS
  USE helpers
  IMPLICIT NONE

  INTEGER, PARAMETER :: sz = 15
  INTEGER, DIMENSION(:), ALLOCATABLE :: array, array2
  INTEGER :: i, new_size = 0
  CHARACTER(18) :: arg, frmt
  INTEGER :: tot, expected_tot

  ALLOCATE(array(sz))
  DO i = 1, sz
    array(i) = i
  ENDDO

  PRINT*, "These values are set initially:"
  WRITE(*, fmt='(15i3)') array

  PRINT*, ''

  DEALLOCATE(array)


  IF(COMMAND_ARGUMENT_COUNT() > 0) THEN
    CALL GET_COMMAND_ARGUMENT(1, arg)
    READ(arg, '(i3)') new_size
  ENDIF
  IF(new_size <= 0) new_size = sz

  ALLOCATE(array2(new_size))
  ALLOCATE(array(sz))

  PRINT*, ''
  PRINT*, "This is the array of size you requested, and should be junk:"

  !Create correct format string for new_size replications of i0, space separated
  WRITE(frmt, fmt='(a, i5, a)') '(',new_size, '(i0, " "))'
  WRITE(*, fmt=frmt) array2

  PRINT*, ''

  PRINT*, "This is another array, and should also be junk:"

  WRITE(*, fmt='(15(i0, " "))') array

  PRINT*, ''

  !Set array back to non-junky values

  DO i = 1, sz
    array(i) = i
  ENDDO

  expected_tot = (1 + sz)*sz/2

  tot = total(array)
  WRITE(*, fmt='(a, i0, a, i0)') "First call,  total is ", tot, &
      " expected ", expected_tot

  tot = total(array)
  WRITE(*, fmt='(a, i0, a, i0)') "Second call, total is ", tot, &
      " expected ", expected_tot



  DEALLOCATE(array, array2)


END PROGRAM MAIN


