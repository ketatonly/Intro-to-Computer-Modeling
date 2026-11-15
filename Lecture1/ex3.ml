(* 
Prove  that  the  number  found  by  Euclid's  algorithm  is  indeed  the  greatest  common 
divisor of two positive integers. Compare it to other GCD search algorithms you know.  
 *)

(*
Answer:
For Euclid's algorithm, we have: m = qn + r where q is quotient and r is the remainder. 
We want to achieve an answer, where in case of m > n, the remainder of m / n is zero, 
and since we are looking for a greatest common divisor, we move to the smaller number and repeat the steps.

We want to find some number d that divides both m and n. Since m = qn + r, if d divides m and n,
  then it will divide r = m - qn as well. If d divides n and r, then it divides m as well, 
since m is a combination of n and r. So GCD (m, n) = GCD (n, r)

Other GCD search algorithms:
The algorithm everyone studies at school is:
Find all the divisors of m and n separately, and multiply the ones that appear for both of them. 

Another algorithm we can make up is to check all the numbers starting from 1 to min(m, n) and try to divide 
both m and n by this number until we reach the maximum. 

Both of the algorithms work well enough for small numbers m and n, but once they go higher and reach bigger 
numbers, finding GCD becomes tedious and tiring for writing it by hand and in terms of using computer's
hardware, it becomes expensive and slow. 
*)



let rec divide a b =
  let r = a mod b in
  if r = 0 then b
  else
    divide b r

let gcd m n = 
  if m = 0 then n
  else if n = 0 then m
  else if m > n then
    divide m n
  else divide n m 

let () = 
  Printf.printf "GCD (0, 4) = %d\n" (gcd 0 4);
  Printf.printf "GCD (7, 0) = %d\n" (gcd 7 0);
  Printf.printf "GCD (30, 6) = %d\n" (gcd 30 6);
  Printf.printf "GCD (15, 7) = %d\n" (gcd 15 7);
  Printf.printf "GCD (30, 12) = %d\n" (gcd 30 12);


