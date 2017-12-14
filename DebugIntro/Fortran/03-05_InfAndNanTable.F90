!This code uses Fortran function pointers
!Worse, it uses an array of function pointers
!This requires using a type and an abstract unterface
!This is hottible, but it allows for a very compact, easily
! extensible code

MODULE functions
  IMPLICIT NONE

  !Define a function signature of correct type for the ops

  ABSTRACT INTERFACE
      FUNCTION op (a, b)
         REAL :: op
         REAL, INTENT(IN) :: a, b
      END FUNCTION op
  END INTERFACE

  !Use a type to hold the function pointer so we can have an array of them
  TYPE f_ptr
    PROCEDURE (op), pointer, nopass :: ptr
  END TYPE f_ptr

  CONTAINS

  FUNCTION add(a, b)
    REAL, INTENT(IN) :: a, b
    REAL :: add
    add = a + b
  END FUNCTION add

  FUNCTION sub(a, b)
    REAL, INTENT(IN) :: a, b
    REAL :: sub
    sub = a - b
  END FUNCTION sub

  FUNCTION mult(a, b)
    REAL, INTENT(IN) :: a, b
    REAL :: mult
    mult = a * b
  END FUNCTION mult

  FUNCTION div(a, b)
    REAL, INTENT(IN) :: a, b
    REAL :: div
    div = a / b
  END FUNCTION div

END MODULE functions

PROGRAM MAIN

  USE functions
  USE, INTRINSIC :: IEEE_ARITHMETIC, ONLY: IEEE_VALUE, IEEE_QUIET_NAN, &
      IEEE_POSITIVE_INF
  IMPLICIT NONE

  REAL :: NaN, Inf, negInf, zero, negZero
  REAL :: row

  INTEGER :: rowNum, opNum
  REAL, DIMENSION(7) :: allRows
  TYPE(f_ptr), DIMENSION(4) :: allOps
  TYPE(f_ptr) :: currOp
  CHARACTER (LEN=1) :: opSymbols(4) = (/ '+', '-', '*', '/' /)
  CHARACTER (LEN=1) :: tab = char(9)

  NaN = IEEE_VALUE(1e0, IEEE_QUIET_NAN)
  Inf = IEEE_VALUE(1e0, IEEE_POSITIVE_INF)
  negInf = -Inf
  zero = 0.0
  negZero = -0.0
  allRows = (/ negInf, -1.0, negZero, 0.0, 1.0, Inf, NaN /)

  allOps(1)%ptr => add
  allOps(2)%ptr => sub
  allOps(3)%ptr => mult
  allOps(4)%ptr => div

  PRINT*, "IEEE Standards for Inf and Nan Arithmetic:"
  PRINT*, "Left operand is in the column, right along the top"
  PRINT*, ''
  DO opNum = 1, 4
    currOp%ptr => allOps(opNum)%ptr
    WRITE(*, "(a12,a2,7(f12.3))") opSymbols(opNum), tab, allRows
    DO rowNum = 1, 7
      row = allRows(rowNum)
      WRITE(*, "(f12.3, a2, 7(f12.3))") row, tab, currOp%ptr(row, negInf), &
          currOp%ptr(row, -1.0), currOp%ptr(row, negZero), &
          currOp%ptr(row, zero), currOp%ptr(row, 1.0), &
          currOp%ptr(row, Inf), currOp%ptr(row, NaN)
    ENDDO

    PRINT*, ''
    PRINT*, "________________________________________________________________"
    PRINT*, ''
  ENDDO

END PROGRAM MAIN

