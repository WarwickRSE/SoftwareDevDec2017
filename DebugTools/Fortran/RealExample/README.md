
This code solves a simple heat equation. It assumes the top and right edges are heated, and the bottom and left are cooled.
Pressing a key iterates the solution. **The solution is not evolving in time: the code is iterating towards the correct solution**

First try the working example to see what is mean to happen. Compile `gfortran serial_bugfree.f90` and run. Providing your terminal program supports colour, you will see red and blue symbols showing the temperature on a grid.

Now try the broken version, `serial.f90`. This has several bugs. It may crash out and leave your terminal coloured. If so, there is a script, `reset_term.sh` that should fix this
If all else fails, reset your terminal completely with `reset`.

Use all the tools to try and find the bugs. Note that this is **hard** This isn't your code, and you don't quite know what it does or how.

The file bugs.txt shows the bugs with a brief description of what and why they occur.
