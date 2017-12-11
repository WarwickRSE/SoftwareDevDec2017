import random

def fill_array(array, use_fixed=False):

  if use_fixed:
    random.seed(1287)
  else:
    random.seed()

  for i in range(0, len(array)):
    array[i] = random.random()* 333.0

def sum_with_loop(array):

  total = 0.0
  for i in range(0, len(array)):
    total += array[i]
  return total

def sum_onto_value(array, init):

  total = init
  for i in range(0, len(array)):
    total += array[i]
  return total

if __name__ == "__main__":

  _sz = 10
  a = 3.0
  array = list(range(0, _sz))
  fill_array(array)

  print("Array of {0} random values, printed to 3dp:".format(_sz));

  print('\t'.join(["{0:6.3f}".format(x) for x in array]))

  sum_f = sum_with_loop(array)
  print("\nSum is {0:12.10f}".format(sum_f))

  init = 2.34642e5
  sum_onto = sum_onto_value(array, init)

  print("\nStarting with {0:12.10f} and adding on the array values gives {1:12.10f}".format(init, sum_onto))

  print("This gives an error of {0:12.10e} in the sum".format((sum_onto-init)-sum_f))


