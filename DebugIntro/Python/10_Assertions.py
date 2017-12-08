
def power(x, n):

  assert(type(n) is int)
  assert(n > 0)
  pow = x
  for i in range(n): pow *= x
  return pow


if __name__ == "__main__":

  print("Python provides an assert")

  x = 2.0
  n = 2
  print("{0} to the power {1} is {2}\n".format(x, n, power(x, n)))

  x = -2.0
  n = 2
  print("{0} to the power {1} is {2}\n".format(x, n, power(x, n)))

  x = 1.0
  n = 1
  print("{0} to the power {1} is {2}\n".format(x, n, power(x, n)))

  x = 2.0
  n = -2
  print("{0} to the power {1} is {2}\n".format(x, n, power(x, n)))

  x = 2.0
  n = 1.5
  print("{0} to the power {1} is {2}\n".format(x, n, power(x, n)))


