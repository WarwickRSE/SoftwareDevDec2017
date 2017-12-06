
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

FUNCTION sum_with_loop(array)
  USE KINDS
  IMPLICIT NONE
  REAL(KIND=eg_kind), DIMENSION(:), INTENT(IN) :: array
  REAL(KIND=eg_kind) :: total, temp, sum_with_loop
  INTEGER, DIMENSION(1) :: sz
  INTEGER :: i

  sz = SHAPE(array)

  DO i = 1, sz(1)
    !Use temp to make sure we're working in float32
    temp = array(i)
    total = total + temp
  ENDDO
  sum_with_loop = total

END FUNCTION sum_with_loop

END MODULE helpers

PROGRAM MAIN

  USE KINDS
  USE helpers

  INTEGER :: i, k
  INTEGER, PARAMETER :: sz = 10
  REAL(KIND=eg_kind), DIMENSION(sz) :: array
  REAL(KIND=eg_kind) :: sum_a, sum_last
  CHARACTER(LEN=20) :: frmt

  k = 0

  CALL fill_array(array)

  WRITE(frmt, fmt='(a, i5, a)') '(',sz, '(f8.3, " "))'
  WRITE(*,fmt='(a, i0, a)') "Array of ", sz, " random values to 3dp is:"
  WRITE(*, fmt=frmt) array

  DO i =1, 5
    sum_a = sum_with_loop(array)
    !PRINT*, sum_a
    !Check sum is the same every time
    IF(i>1 .AND. sum_a /= sum_last) k = k + 1
    PRINT*, k
    sum_last = sum_a
  ENDDO

END PROGRAM MAIN

