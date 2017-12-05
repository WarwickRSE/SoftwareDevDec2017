import time
import sys

if __name__ == "__main__":

  _reps = 1000

  quiet = False
  fix = False

  if '-q' in sys.argv: quiet = True
  if 'fix' in sys.argv : fix = True

  #Open once to remove previous content
  outfile = open('./tmp.out', 'w')
  outfile.close()

  start_time=time.time()

  #------ first path is bad, second a fixed version
  if not fix:
    for i in range(0, _reps):
      if(not quiet): print(i)
      outfile = open('./tmp.out', 'a')
      outfile.write(str(i))
      outfile.close()

  else:
    outfile = open('./tmp.out', 'a')
    for i in range(0, _reps):
      if(not quiet): print(i)
      outfile.write(str(i))

    outfile.close()
  #------------

  elapsed_time=time.time()-start_time

  print("Elapsed time: {0} s".format(elapsed_time))

