import math

def add(a, b):
  return a + b

def sub(a, b):
  return a - b

def mul(a, b):
  return a * b

def sgn(a):
  return math.copysign(1, a)

def div(a, b):
  try:
    return a / b
  except ZeroDivisionError:
    return a * sgn(b) * float('inf')

def genTable():

  NaN = float('nan')
  Inf = 1e310
  negInf = - Inf
  zero = 0.0
  negZero = - 0.0

  opSymbols = ['+', '-', '*', '/']
  allOps = [add, sub, mul, div]
  allRows = [ negInf, -1.0, negZero, zero, 1.0, Inf, NaN]


  print("IEEE Standards for Inf and Nan Arithmetic:\n")
  print("Left operand is in the column, right along the top\n")

  for opNum in range(0, 4):
    op = allOps[opNum]

    print("{0}\t{1}\t-1.0\t{2}\t0.0\t1.0\t{3}\t{4}\n".format(opSymbols[opNum],negInf, negZero, Inf, NaN))

    for rowNum in range(0, 7):
      row = allRows[rowNum]
      print("{0}\t{1}\t{2}\t{3}\t{4}\t{5}\t{6}\t{7}".format(row, op(row, negInf), op(row, -1.0), op(row, negZero), op(row, zero), op(row, 1.0), op(row, Inf), op(row, NaN)))

    print("____________________________________________________________")
    print("");

if __name__ == '__main__':
  genTable()

