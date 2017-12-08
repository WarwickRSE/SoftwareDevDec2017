
PROGRAM MAIN

  IMPLICIT NONE
  INTEGER, PARAMETER :: sz = 15
  INTEGER, DIMENSION(:), ALLOCATABLE :: array
  INTEGER, DIMENSION(:), POINTER :: ptr

  !First bug
  PRINT*, array(10)
  array(12) = 120

  !Working code
  ALLOCATE(array(sz))
  PRINT*, array(10)
  array(12) = 120

  !Second bug
  ALLOCATE(array(sz))

  !------------------------------
  !Fortran Pointers
  !Third bug
  !PRINT*, ptr(10)

  !Working code
  !ALLOCATE(ptr(sz))
  !PRINT*, ptr(10)


END PROGRAM MAIN


