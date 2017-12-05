


if __name__ == "__main__":


  print("Mixed Mode arithmetic (using a mix of float and integer) is risky!")
  print("In Python there are major differences between Py 2 and Py 3\n")

  print("This temperature conversion program shows a common mistake:")

  tempInC = 18.0;
  tempInF = 9/5 * tempInC + 32;
  correctTempInF = 9.0/5.0 * tempInC + 32.0;


  print("{0} C is {1} F ?".format(tempInC, tempInF))
  print("Correct answer is {0} F".format(correctTempInF))

  tempInF = 9//5 * tempInC + 32;
  print("How about: {0} C is {1} F ?".format(tempInC, tempInF))

