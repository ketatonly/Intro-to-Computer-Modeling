(* 
A puzzle called the Tower of Hanoi, introduced by the French mathematician Edouard 
Lucas in 1883, states: We are given of a tower of disks, initially stacked in decreasing size on one of 
three pegs as is shown in figure: 

The goal is to move the entire tower onto one of the pegs so that the following two rules are to be 
observed: 1) move only one disc at a time and 2) never put a larger disc  onto a  smaller one in this 
process.  
 a) In the case of n disks, find how many moves are necessary and sufficient to perform the task. 
 b) Write down an algorithm for solving the puzzle.  

 Answer:
 a) In the case of n disks, the number of moves are: 2^n - 1
 b) See below:
*)

let hanoi n =
  let cnt = ref 0 in
  let rec helper n src dest aux = 
    if n = 0 then ()
    else if n = 1 then ( 
      cnt := !cnt + 1;
      Printf.printf "Move disk %d from %s to %s (move %d)\n" n src dest !cnt )
    else (
      helper (n-1) src aux dest;
      cnt := !cnt + 1;
      Printf.printf "Move disk %d from %s to %s (move %d)\n" n src dest !cnt;
      helper (n-1) aux dest src
    )
  in 
  helper n "A" "B" "C";
  Printf.printf "Total number of moves: %d\n" !cnt


let () =
  Printf.printf "--- Hanoi 0 ---\n";
  hanoi 0;
  Printf.printf "--- Hanoi 1 ---\n";
  hanoi 1;
  Printf.printf "--- Hanoi 2 ---\n";
  hanoi 2;
  Printf.printf "--- Hanoi 3 ---\n";
  hanoi 3;
  Printf.printf "--- Hanoi 4 ---\n";
  hanoi 4