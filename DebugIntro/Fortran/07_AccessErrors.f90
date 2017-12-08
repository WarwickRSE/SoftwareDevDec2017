
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
    INTEGER :: rand_size
    INTEGER, INTENT(IN) :: input_seed
    CALL RANDOM_SEED(size=rand_size)
    ALLOCATE(seed(1:rand_size))
    seed = input_seed
    CALL RANDOM_SEED(put=seed)
    DEALLOCATE(seed)

  END SUBROUTINE
END MODULE RANDOM


PROGRAM MAIN

  USE RANDOM
  IMPLICIT NONE

  INTEGER, PARAMETER :: sz = 16
  INTEGER, DIMENSION(sz) :: array, array2
  INTEGER :: i, r
  CHARACTER(28) :: frmt

  array = 0
  array2 = 0

  CALL random_init_time()
  CALL RANDOM_NUMBER(randval)
  r = INT(randval*2.0)

  IF(r > 0) THEN
    !Fill array2
    DO i = 1, sz + 2
      array2(i) = i
    ENDDO
  ELSE
    !Fill array
    DO i = 1, sz + 2
      array(i) = i
    ENDDO
  ENDIF

  WRITE(frmt, fmt='(a, i5, a)') '(',sz, '(i0, " "))'
  PRINT*, "First array is:"
  WRITE(*, fmt=frmt) array

  PRINT*, "Second array is:"
  WRITE(*, fmt=frmt) array2



END PROGRAM MAIN


