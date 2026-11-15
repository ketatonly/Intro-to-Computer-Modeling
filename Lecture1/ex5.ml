(* 
Downstairs  in  a  house  are  three  identical  on-off  switches. 
One of them controls the lamp in the attic. The puzzle is to work out which 
switch controls the lamp.   
 The rules are as follows. You are allowed to manipulate the switches 
all you like, and then you are allowed only one trip to the attic. Find an 
algorithm for solving the puzzle.  

Answer:
We can turn switch 1 on, wait for a while, then turn it off and turn the switch 2 on,
after going upstairs, if the bulb is on, then the answer is switch 2, if it is off and warm/hot,
  then the answer is switch 1, if it's off and cold, then the answer is swtich 3.
*)