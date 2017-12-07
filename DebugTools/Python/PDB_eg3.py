def my_sqrt(input):
  import math
  return math.sqrt(input)

def get_x(indx):
  return ((10*indx)%7 -3)

def main():
  for i in range(5):
    x=get_x(i)
    sqrt_x = my_sqrt(x)
    print(x, sqrt_x)

  x = -9.0
  sqrt_x = my_sqrt(x)
  print(x, sqrt_x)



