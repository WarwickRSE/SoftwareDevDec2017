
MODULE KINDS

  !Constants for "single" and "double" precision floats
  INTEGER, PARAMETER :: real32 = KIND(1.0)
  INTEGER, PARAMETER :: real64 = KIND(1.0d0)

END MODULE KINDS


PROGRAM MAIN

  USE KINDS

  INTEGER :: i
  INTEGER, PARAMETER :: reps = 1000

  INTEGER :: clock_start, clock_end, clock_counts

  CHARACTER(LEN=10) :: arg
  LOGICAL :: quiet = .FALSE.

  IF(COMMAND_ARGUMENT_COUNT() > 0) THEN
    CALL GET_COMMAND_ARGUMENT(1, arg)
    IF(TRIM(arg) == "-q") quiet = .TRUE.
  ENDIF

  !Open once to truncate previous content
  OPEN(unit=1, file="./tmp.out", status='replace')
  CLOSE(1)
  CALL SYSTEM_CLOCK(clock_start, clock_counts)

#ifndef FIX

  DO i = 1, reps
    IF(.NOT. quiet) PRINT*, i

    OPEN(unit=1, file="./tmp.out", status='old', position='append')
    WRITE(1, fmt='(i0, a)') i, " "
    CLOSE(1)

  ENDDO
#else
  OPEN(unit=1, file="./tmp.out", status='old')

  DO i = 1, reps
    IF(.NOT. quiet) PRINT*, i
    WRITE(1, fmt='(i0, a)') i, " "
  ENDDO

  CLOSE(1)

#endif
  CALL SYSTEM_CLOCK(clock_end)
  PRINT*, "Elapsed time is ", FLOAT(clock_end - clock_start)/FLOAT(clock_counts), 's'

END PROGRAM MAIN


