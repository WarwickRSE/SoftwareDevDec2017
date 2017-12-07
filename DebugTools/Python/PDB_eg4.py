from __future__ import print_function
import random
norand = False
debug = False

def random_init_time():
  import datetime
  random.seed(datetime.datetime.now())

def random_init(input_seed):
  random.seed(input_seed)

def fill_array(array):

  global debug
  array_shape = len(array)
  if (norand):
    for i in range(array_shape):
      array_shape[i] = i
  else:
    if (not debug):
      #Init with fixed value
      random_init_time()
    else:
      #Init with fixed value
      random_init(1287)
    #Fill array with increasing values jumping either 1 or 2
    next_rand = random.random()
    array[0] = int(next_rand*4)
    for i in range(array_shape-1):
      next_rand = random.random()
      array[i+1] = array[i] + 1 + int(next_rand*2)

def get_index_of_value(array, target_val):

  global debug
  global norand
  #This is an iterative version, using a loop with early break
  found_at = -1000
  array_sz = len(array)

  lower = 0
  upper = array_sz-1

  centre = (lower + upper)/2
  stride = (upper - lower)/2

  for i in range(array_sz-1):
    #Actually need only log_2(array_sz) but size-1 is a strict upper
    #bound on number of iterations and we shall break early
    if (debug):
      print("Iteration {}".format(i))
      print("Stride {} centre {}".format(stride, array[centre]))
      print("Lower {} upper {}".format(lower, upper))
      print(array[lower:upper-1])
      print("")
    if (array[centre] > target_val):
      upper = upper - stride
      centre = (lower + upper)/2
      stride = (upper - lower)/2
    elif (array[centre] < target_val):
      lower = lower + stride
      centre = (lower + upper)/2
      stride = (upper -lower)/2
    else:
      stride = 0

    if (stride < 1):
      if (array[centre] == target_val):
        return centre
      else:
        return -1

def main(target = None):

  global debug
  sz = 12
  array =[0] * (sz-1)
  fill_array(array)

  print("Pos")
# Numbers 1 to sz, tab separated
  for i in range(sz):
    print("{}\t".format(i), end="")
  print("")
  print("Val")
  for i in range(sz):
    print("{}\t".format(array[i]), end="")
  print("")

  if (target):
    target_val = target
  else:
    target_val = sz / 2 #Default target
# Remeber in real code to validate inputs!

  print("Target is ", target_val)

  indx = get_index_of_value(array, target_val)
  if(indx >= 1):
    print("Found at position ", indx)
  else:
    print("Target not found")
