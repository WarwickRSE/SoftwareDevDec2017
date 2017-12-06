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

CONTAINS

SUBROUTINE fill_array(array)

  USE KINDS
  USE RANDOM
  INTEGER, DIMENSION(:) :: array
  INTEGER, DIMENSION(1) :: array_shape
  INTEGER :: i
  REAL(KIND=real32) :: next_rand

  array_shape = SHAPE(array)
#ifdef NORAND
  DO i =0, array_shape(1)
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
  array(1) = next_rand * 4
  DO i =2, array_shape(1)
    CALL RANDOM_NUMBER(next_rand)
    array(i) = array(i-1) + 1 + next_rand*2
  ENDDO

#endif

END SUBROUTINE fill_array

FUNCTION get_index_of_value(array, target_val)
  !This is an iterative version, using a loop with early break

  IMPLICIT NONE
  INTEGER :: get_index_of_value, target_val
  INTEGER :: found_at
  INTEGER, DIMENSION(:) :: array
  INTEGER :: stride
  INTEGER :: i, j, centre
  INTEGER lower, upper, array_sz
  INTEGER, DIMENSION(1) ::array_shape

  found_at = -1000
  array_shape = SHAPE(array)
  array_sz = array_shape(1)

  lower = 1
  upper = array_sz + 1

  stride = array_sz/2;
  centre = array_sz/2;

  DO i = 1, array_sz-1
    !Actually need only log_2(array_sz) but size-1 is a strict upper
    !bound on number of iterations and we shall break early

#ifdef DEBUG
    PRINT*, "Iteration", i
    WRITE(*, fmt='(a, i0, a, i0)') "Stride ", stride, " centre ", array(centre)
    WRITE(*, fmt='(a, i0, a, i0)') "Lower ", lower, " upper ", upper
    PRINT*, array(lower:upper-1)
    PRINT*, ''
#endif
    IF(array(centre) > target_val) THEN
      upper = upper - stride
      centre = (lower + upper)/2
      stride = (upper - lower)/2
    ELSE IF(array(centre) < target_val) THEN
      lower = lower + stride
      centre = (lower + upper)/2
      stride = (upper - lower)/2
    ELSE
      stride = 0;
    ENDIF
    IF(stride < 1) THEN
      IF(array(centre) == target_val) THEN
        found_at = centre
      ELSE
        found_at = -1
      ENDIF
      EXIT
    ENDIF
  ENDDO
  get_index_of_value = found_at

END FUNCTION get_index_of_value

END MODULE HELPERS

PROGRAM MAIN

  USE KINDS
  USE HELPERS

  INTEGER, PARAMETER :: sz = 12
  INTEGER, DIMENSION(sz):: array
  INTEGER :: i, target_val, indx
  CHARACTER(18) :: arg, frmt

  CALL fill_array(array)

  PRINT*, 'Pos'
  DO i = 1, sz
    !Numbers 1 to sz, tab separated
    WRITE(*, fmt='(i0, a)', ADVANCE='no') i, char(9)
  ENDDO
  PRINT*, ''
  PRINT*, 'Val'
  DO i = 1, sz
    WRITE(*, fmt='(i0, a)', ADVANCE='no') array(i), char(9)
  ENDDO
  PRINT*, ''

  target_val = sz / 2  !Default target

  IF(COMMAND_ARGUMENT_COUNT() > 0) THEN
    CALL GET_COMMAND_ARGUMENT(1, arg)
    READ(arg, '(i3)') target_val
  ENDIF
  !Remeber in real code to validate inputs!

  WRITE(*, fmt='(a, i0)') 'Target is ', target_val

  indx = get_index_of_value(array, target_val)
  IF(indx >= 1) THEN
    WRITE(*, fmt='(a, i0)') "Found at position ", indx
  ELSE
    PRINT*, "Target not found"
  ENDIF

END PROGRAM MAIN


