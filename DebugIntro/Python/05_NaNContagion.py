
def isNaN(value):
  pass

if __name__ == "__main__":

  _sz = 12
  isNaN = float('nan')
  a = 3.0
  print("NaN (not a number) occurs from operations like sqrt(-1) or divide by 0 (see Note 1)");
  print("NaN is contagious: any calculation with it gives NaN");

  print("{0} + {1} = {2}".format(a, isNaN, a + isNaN))
  print("{0} * {1} = {2}".format(a, isNaN, a * isNaN))

  array =  range(0, _sz)
  new_array = range(0, _sz)

  print("\n This means it can spread. This array is updated by summing each element with its neighbours\n")
  array[_sz/2] = isNaN

  for j in range(0, 6):
    print("Iter {0}".format(j))
    print('\t'.join([str(x) for x in array]))

    for i in range(1, _sz-1):
      new_array[i] = (array[i-1] + array[i] + array[i+1])/3.0

    for i in range(1, _sz-1):
      array[i] = new_array[i]

  print("\n")

  print("NaN is also special in comparisons: it is not equal to anything, even itself.\n");
  print("{0} == {1} => {2}".format(isNaN, isNaN, isNaN==isNaN))
  print("{0} < {1} => {2}".format(isNaN, isNaN, isNaN<isNaN))
  print("{0} > {1} => {2}".format(isNaN, isNaN, isNaN>isNaN))


