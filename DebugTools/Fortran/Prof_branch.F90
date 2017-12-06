

!Adapted from
!https://stackoverflow.com/questions/11227809/
!why-is-it-faster-to-process-a-sorted-array-than-an-unsorted-array

PROGRAM MAIN

  INTEGER, PARAMETER :: sz = 32768
  INTEGER, DIMENSION(sz) :: dat
  INTEGER :: i, j, iters = 1000
  INTEGER :: clock_start, clock_end, clock_counts
  INTEGER(KIND=8) :: total

  total = 0
  DO i = 1, sz
    dat(i) = i
  ENDDO

  CALL SYSTEM_CLOCK(clock_start, clock_counts)

  DO j = 1, iters
    DO i = 1, sz

#ifdef BR_1
          !Alternate every other item
          IF (IAND(dat(i), 2) == 0) THEN
#elif BR_2
          !Alternate more TFFFTFFF...
          IF (IAND(dat(i), 3) == 0) THEN
#elif BR_3
          !Always true */
          IF (IAND(dat(i), z'80000000') == 0) THEN
#else
          !One style for start another for rest
          IF (dat(i) >= sz/2) THEN
#endif
          total = total + dat(i);
      ENDIF
    ENDDO
  ENDDO


  CALL SYSTEM_CLOCK(clock_end)
  PRINT*, "Elapsed time is ", FLOAT(clock_end - clock_start)/FLOAT(clock_counts), 's'

END PROGRAM MAIN


