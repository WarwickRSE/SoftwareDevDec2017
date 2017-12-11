



if __name__ == "__main__":


  import sys
  if sys.version_info.major == 2:
    j = sys.maxint
  else:
    j = sys.maxsize

  k = - j - 1

  print("In Python 2 normal ints are between -sys.maxint-1 of {0} and sys.maxint of {1}".format(k, j))
  print("In Python 3 ints and longs are the same thing. There is a maxsize value though")

  if sys.version_info.major == 2:
    print("Maxint is a {0}".format(type(j)))
    print("Adding one to maxint: {0} + 1 = {1} which is {2}".format(j, j+1, type(j+1)))
  else:
    print("Maxsize is a {0}".format(type(j)))
    print("Adding one to maxsize: {0} + 1 = {1} which is {2}".format(j, j+1, type(j+1)))

  print("Subtracting one from min : {0} - 1 = {1}".format(k, k-1))

  print("\nThe absolute maximum integer is limited only by memory and computational effort")


  a = sys.float_info.min
  b = sys.float_info.max
  print("\nFloating point numbers also have limits")
  print("The min and max float are {0} and {1}".format(a, b))

  bb = b * 1.1
  print("float_info.max * 1.1 is {0}".format(bb))

  bb = b + 1
  print("Bonus. The following is unexpected. See first note.")
  print("float_info.max + 1 is {0}".format(bb))

  bb = a/1.1
  print("Bonus. The following is unexpected. See second note.")
  print("float_info.min / 1.1 is {0}".format(bb))

 #print("{0} as a float is {1:23.20f}".format(string, d))

