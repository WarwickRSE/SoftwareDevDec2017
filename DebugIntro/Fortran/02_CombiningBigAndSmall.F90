
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

MODULE HELPERS
  IMPLICIT NONE
 CONTAINS

SUBROUTINE fill_array(array)

  USE KINDS
  USE RANDOM
  REAL(KIND=eg_kind), DIMENSION(:) :: array

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

FUNCTION sum_with_loop(array)
  USE KINDS
  IMPLICIT NONE
  REAL(KIND=eg_kind), DIMENSION(:), INTENT(IN) :: array
  REAL(KIND=real32) :: total, temp, sum_with_loop
  INTEGER, DIMENSION(1) :: sz
  INTEGER :: i

  !See also 06 for why this is not in definition
  total = 0.0
  sz = SHAPE(array)

  DO i = 1, sz(1)
    !Use temp to make sure we're working in float32
    temp = array(i)
    total = total + temp
  ENDDO
  sum_with_loop = total

END FUNCTION sum_with_loop

FUNCTION sum_with_loop_64(array)
  USE KINDS
  IMPLICIT NONE
  REAL(KIND=eg_kind), DIMENSION(:), INTENT(IN) :: array
  REAL(KIND=real64) :: total, temp, sum_with_loop_64
  INTEGER, DIMENSION(1) :: sz
  INTEGER :: i

  !See also 06 for why this is not in definition
  total = 0.0
  sz = SHAPE(array)

  DO i = 1, sz(1)
    !Use temp to make sure we're working in float64
    temp = array(i)
    total = total + temp
  ENDDO
  sum_with_loop_64 = total

END FUNCTION sum_with_loop_64

FUNCTION sum_onto_value(array, init)
  USE KINDS
  IMPLICIT NONE
  REAL(KIND=eg_kind), DIMENSION(:), INTENT(IN) :: array
  REAL(KIND=eg_kind), INTENT(IN) :: init
  REAL(KIND=eg_kind) :: total, temp, sum_onto_value
  INTEGER, DIMENSION(1) :: sz
  INTEGER :: i

  !See also 06 for why this is not in definition
  total = init
  sz = SHAPE(array)

  DO i = 1, sz(1)
    !Use temp to make sure we're working in float64
    temp = array(i)
    total = total + temp
  ENDDO
  sum_onto_value = total

END FUNCTION sum_onto_value


END MODULE HELPERS

PROGRAM MAIN

  USE KINDS
  USE HELPERS

  INTEGER, PARAMETER :: sz = 15
  REAL(KIND=eg_kind), DIMENSION(sz) :: array
  REAL(KIND=real32) :: sum_32
  REAL(KIND=real64) :: sum_64, sum_intrinsic
  REAL(KIND=eg_kind) :: sum_onto, init
  CHARACTER(LEN=20) :: frmt

  CALL fill_array(array)

  WRITE(frmt, fmt='(a, i5, a)') '(',sz, '(f8.3, " "))'
  WRITE(*,fmt='(a, i0, a)') "Array of ", sz, " random values to 3dp is:"
  WRITE(*, fmt=frmt) array

  sum_32 = sum_with_loop(array)
  sum_64 = sum_with_loop_64(array)

  PRINT*, ''
  WRITE(*, fmt='(a, f15.10, a, f15.10)') "Summed as floats (32bit) ", sum_32, &
      " and as double (64bit) ", sum_64

  WRITE(*, fmt='(a, e16.9)') "Difference is ", sum_64-sum_32

  sum_intrinsic = SUM(array)

  WRITE(*, fmt='(a, e16.9)') "Difference between float and intrinsic sum ",&
    sum_32-sum_intrinsic

  WRITE(*, fmt='(a, e16.9)') "Difference between double and intrinsic sum ",&
    sum_64-sum_intrinsic


  PRINT*, ''
  PRINT*, ''
  init = 2.34642d5
  sum_onto = sum_onto_value(array, init)

  WRITE(*, fmt='(a, e16.9, a, e16.9)') "Starting with ", init, &
      " and adding array values gives: ", sum_onto
  WRITE(*, fmt='(a, e16.9, a)') "This gives an error of ", (sum_onto-init)-sum_32, &
      " in the sum"
  !If you change eg_kind to be real64, change this to use sum_64 to match

END PROGRAM MAIN

