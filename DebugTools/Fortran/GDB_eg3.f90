MODULE KINDS

  !Constants for "single" and "double" precision floats
  INTEGER, PARAMETER :: real32 = KIND(1.0)
  INTEGER, PARAMETER :: real64 = KIND(1.0d0)

END MODULE KINDS


MODULE HELPERS

  USE KINDS
  IMPLICIT NONE
  CONTAINS

  FUNCTION my_sqrt(input)

    REAL(KIND=real32), INTENT(IN) :: input
    REAL(KIND=real32) :: my_sqrt

    my_sqrt = sqrt(input)

  END FUNCTION my_sqrt

  FUNCTION get_x(indx)

    INTEGER, INTENT(IN) :: indx
    REAL(KIND=real32) :: get_x

    get_x = (MOD(10*indx, 7) - 3)
    !Alternates +ve and -ve

  END FUNCTION
END MODULE HELPERS

PROGRAM MAIN

  USE KINDS
  USE HELPERS

  INTEGER, PARAMETER :: sz = 12
  INTEGER, DIMENSION(:), ALLOCATABLE :: a
  INTEGER :: i
  REAL(KIND=real32) :: x, sqrt_x


  DO i = 1, 5
    x = get_x(i)
    sqrt_x = my_sqrt(x)

    PRINT*, x, sqrt_x
  ENDDO

  x = -9.0
  sqrt_x = my_sqrt(x)
  PRINT*, x, sqrt_x

END PROGRAM MAIN


