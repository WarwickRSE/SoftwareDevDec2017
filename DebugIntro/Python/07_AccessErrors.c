



if __name__ == "__main__":

  _sz = 16
  array =  range(0, _sz)

  print("Suppose we have some array data, e.g.:")
  print(' '.join([str(x) for x in array]))

  print("\nTrying to read past list bounds is an exception")
  try:
    print(array[_sz+1])
  except Exception as e:
    print("Caught exception: {0}".format(e))

  array = None

  print("\nWe might try checking the length before accessing:")
  try:
    if len(array) > 0:
      print(array[0])
  except Exception as e:
    print("Caught exception: {0}".format(e))

  print("We still have to beware of, and catch, relevant exceptions")

