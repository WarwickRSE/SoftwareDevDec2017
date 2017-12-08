
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

CONTAINS

SUBROUTINE fill_array(array, sz)

  USE RANDOM
  INTEGER, DIMENSION(:), POINTER :: array
  INTEGER :: i, sz
  REAL :: next_rand

  IF(ASSOCIATED(array)) NULLIFY(array)
  ALLOCATE(array(sz))
#ifdef NORAND
  DO i =1, sz
    array(i) = i
  ENDDO
#else
#  ifndef DEBUG
  CALL random_init_time()
  !Init RNG with current time
#  else
  CALL random_init(1287)
  !Init with fixed value
#  endif

  !Fill array with increasing values jumping either 1 or 2
  CALL RANDOM_NUMBER(next_rand)
  array(1) = FLOOR(next_rand * 4.0)
  DO i =2, sz
    CALL RANDOM_NUMBER(next_rand)
    array(i) = array(i-1) + 1 + FLOOR(next_rand*2.0)
  ENDDO

#endif

END SUBROUTINE fill_array

SUBROUTINE f_wait(sec)
  !Wait for sec seconds, burning CPU all the while
  IMPLICIT NONE
  INTEGER :: sec
  INTEGER :: clock_start, clock_now, clock_counts

  CALL SYSTEM_CLOCK(clock_start, clock_counts)
  clock_now = clock_start

  DO WHILE(clock_now < clock_start + sec*clock_counts)
    CALL SYSTEM_CLOCK(clock_now)
  ENDDO

END SUBROUTINE f_wait

END MODULE HELPERS

PROGRAM MAIN

  USE KINDS
  USE HELPERS
  IMPLICIT NONE
  INTEGER, PARAMETER :: sz = 10
  INTEGER, DIMENSION(:), POINTER:: array
  INTEGER :: i
  CHARACTER(18) :: frmt

  NULLIFY(array)
  WRITE(frmt, fmt='(a, i5, a)') '(',sz, '(i0, " "))'
  CALL fill_array(array, sz)

  DO i = 1, 5
    CALL f_wait(1)
    WRITE(*, fmt=frmt) array
    PRINT*, ''
    CALL fill_array(array, sz)
  ENDDO

  DEALLOCATE(array)

END PROGRAM MAIN


