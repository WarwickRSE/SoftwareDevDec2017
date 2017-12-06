
MODULE KINDS
  !Constants for "single" and "double" precision floats
  INTEGER, PARAMETER :: real32 = KIND(1.0)
  INTEGER, PARAMETER :: real64 = KIND(1.0d0)

  INTEGER, PARAMETER :: eg_kind = real32

END MODULE KINDS

MODULE RANDOM
  IMPLICIT NONE
  INTEGER, DIMENSION(:), ALLOCATABLE :: seed
  INTEGER :: time
  REAL :: randval

  CONTAINS

  SUBROUTINE random_init_time()
    !Seed the RNG with current time
    !This is the "proper" way, mostly you will
    ! just see a single integer as the seed
    INTEGER :: rand_size
    CALL RANDOM_SEED(size=rand_size)
    ALLOCATE(seed(1:rand_size))
    CALL SYSTEM_CLOCK(time)
    seed = time
    CALL RANDOM_SEED(put=seed)
    DEALLOCATE(seed)

  END SUBROUTINE
  SUBROUTINE random_init(input_seed)
    !Seed the RNG with given integer
    INTEGER, INTENT(IN) :: input_seed
    INTEGER :: rand_size
    CALL RANDOM_SEED(size=rand_size)
    ALLOCATE(seed(1:rand_size))
    seed = input_seed
    CALL RANDOM_SEED(put=seed)
    DEALLOCATE(seed)

  END SUBROUTINE
END MODULE RANDOM

MODULE helpers
  USE KINDS
CONTAINS

SUBROUTINE fill_array(array)

  USE KINDS
  USE RANDOM
  REAL(KIND=eg_kind), DIMENSION(:) :: array
  INTEGER :: i

#  ifndef DEBUG
  CALL random_init_time()
  !Init RNG with current time
#  else
  CALL random_init(1287)
  !Init with fixed value
#  endif

  !Fill with random numbers between 0 and 1
  CALL RANDOM_NUMBER(array)
  !Bump to numbers from 0 to 333.0
  array = array * 333.0

END SUBROUTINE fill_array

SUBROUTINE show_array(array)
  REAL(KIND=real32), DIMENSION(:) :: array
  INTEGER, DIMENSION(1) :: array_shape
  INTEGER :: array_sz
  CHARACTER(18) :: frmt

  array_shape = SHAPE(array)
  array_sz = array_shape(1)

  WRITE(frmt, fmt='(a, i5, a)') '(',array_sz, '(i0, " "))'
  WRITE(*, fmt=frmt) array

END SUBROUTINE

SUBROUTINE output_array(array, filename)
  REAL(KIND=real32), DIMENSION(:) :: array
  INTEGER, DIMENSION(1) :: array_shape
  INTEGER :: array_sz
  CHARACTER(18) :: frmt
  CHARACTER(LEN=*) :: filename

  OPEN(unit=1, file=filename, status='replace')

  array_shape = SHAPE(array)
  array_sz = array_shape(1)

  WRITE(frmt, fmt='(a, i5, a)') '(',array_sz, '(i0, " "))'
  WRITE(1, fmt=frmt) array
  CLOSE(1)

END SUBROUTINE

SUBROUTINE solve_array(array)
  !"Solve" the array. Here we just do some test operations, rather 
  !than a useful algorithm

  INTEGER :: i
  REAL(KIND=real32) :: inc, div, recip_div
  REAL(KIND=real32), DIMENSION(:) :: array
  INTEGER, DIMENSION(1) :: array_shape
  INTEGER :: array_sz

  array_shape = SHAPE(array)
  array_sz = array_shape(1)

  inc = 3.0
  div = 2.0
  recip_div = 1.0/div
  DO i = 1, array_sz
    CALL add_to_element(array(i), inc)
    IF(array(i) > 100.0) CALL divide_element(array(i), div)
    !IF(array(i) > 100.0) CALL multiply_element(array(i), recip_div)
  ENDDO

END SUBROUTINE

SUBROUTINE add_to_element(element, increment)
  REAL(KIND=real32):: element, increment
  element = element + increment

END SUBROUTINE
SUBROUTINE divide_element(element, divisor)
  REAL(KIND=real32):: element, divisor
  element = element / divisor

END SUBROUTINE
SUBROUTINE multiply_element(element, multiplicand)
  REAL(KIND=real32):: element, multiplicand
  element = element * multiplicand

END SUBROUTINE

END MODULE helpers

PROGRAM MAIN

  USE KINDS
  USE helpers

  INTEGER :: i
  INTEGER, PARAMETER :: sz = 15, n_iter = 10000
  REAL(KIND=real32), DIMENSION(sz) :: array
  CHARACTER(LEN=20) :: frmt

  CALL fill_array(array)

  WRITE(frmt, fmt='(a, i5, a)') '(',sz, '(f8.3, " "))'
  WRITE(*,fmt='(a, i0, a)') "Array of ", sz, " random values to 3dp is:"
  WRITE(*, fmt=frmt) array

  DO i = 1, n_iter
    PRINT*, i
    CALL solve_array(array)
  ENDDO

END PROGRAM MAIN

