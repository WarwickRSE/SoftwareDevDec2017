
PROGRAM MAIN

  INTEGER, PARAMETER :: sz = 12
  INTEGER, DIMENSION(:), ALLOCATABLE :: a
  INTEGER :: i

  !ALLOCATE(a(sz))

  DO i = 1, sz
    a(i) = 0
    PRINT*, a(i)
  ENDDO

END PROGRAM MAIN


