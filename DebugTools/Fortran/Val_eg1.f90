

PROGRAM MAIN

  INTEGER, PARAMETER :: sz = 10
  INTEGER, DIMENSION(:), ALLOCATABLE, TARGET :: a
    !Target attribute lets us point to elements of the array
  INTEGER :: i
  INTEGER, POINTER :: ptr

  ALLOCATE(a(sz))

  ptr => a(6)

  DO i =1, sz + 1
    a(i) = i
    PRINT*, i, a(i)
  ENDDO

  DEALLOCATE(a)

  IF( .NOT. ASSOCIATED(ptr)) PRINT*, "****** Pointer not associated ****"
  PRINT*, ASSOCIATED(ptr)
  WRITE(*, fmt='(a, i0)') "Random pointer data: ", ptr

  PRINT*, "Done"

END PROGRAM MAIN


