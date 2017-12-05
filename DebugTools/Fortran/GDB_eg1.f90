
PROGRAM MAIN


  INTEGER, DIMENSION(3) :: a
  INTEGER :: i

  a = 0

  DO i = 1, 4
    PRINT*, a(i)
    a(i) = 0
  ENDDO

END PROGRAM MAIN


