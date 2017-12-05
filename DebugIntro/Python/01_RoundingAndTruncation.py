



if __name__ == "__main__":


  a = 3.0
  b = 5.0
  d = 3.14159265358979323846
  string = "3.14159265358979323846"

  print("Floats are truncated to store into integers:")
  print("{0}/{1} as an integer is {2}".format(a, b, int(a/b)))

  b = 2.0
  print("{0}/{1} as an integer is {2}\n".format(a, b, int(a/b)))

  print("In Python there is only one sort of floating point number, but this has limited precision")
  print("{0} as a float is {1:23.20f}".format(string, d))

  f = 0.5
  g = 0.01
  print("{0}/{1} might not be 50! Here it is {2}".format(f, g, int(f/g)))

  print("\nSumming small numbers can give unexpected results due to finite precision:\n")

  f = 0.0
  n = 10000
  g = 1.0/n

  for i in range(0, n):
    f += g
  j = int(f)
  print("{0} summed {1} times is {2:23.20f} and rounds to {3}".format(g, n, f, j))

  j = 0
  f = 0.0

  while f < 1.0:
    j += 1
    f += g

  print("Using {0} as the increment in a while loop gives {1} iterations where we expect {2}\n".format(g, j, n))
