from __future__ import print_function

def fill_array(array):
# Fill passed in array with random values. Array must have been allocated
  import random
  import datetime

  random.seed(datetime.datetime.now())
  array_size = len(array)
  j=0

  for i in range(array_size):
    array[i] = random.random()*10000.0/30.0
    if (array[i] > 100.0): j+=1

  print(j)

def show_array(array):
# Print array to terminal
  array_size = len(array)
  for i in range(array_size):
    print("{}\t".format(array[i], end=""))
  print("")

def ouput_array(array,filename):
# Print array to file of name
  array_size = len(array)
  fh = open(filename,"w")

  for i in range(array_size):
    fh.write("{}\t".format(array[i], end=""))

  fh.close()

def solve_array(array):
# "Solve" the array. Here we just do some test operations, rather than
#a useful algorithm

  array_size = len(array)
  inc = 3.0
  div = 2.0
  recip_div = 1.0/div

  for i in range(array_size):
    if (array > 100.0): array[i] = divide_element(array[i], div)
    #if (array > 100.0): array[i] = multiply_element(array[i], recip_div)

def add_to_element(value, increment):
  return value+increment

def divide_element(value, divisor):
  return value/divisor

def multiply_element(value, multiplicand):
  return value * multiplicand

def main(size = 10000,n_iter=1000):

  array = [0]*size

  fill_array(array)

  for i in range(n_iter):
    print(i)
    solve_array(array)
