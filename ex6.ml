(*
  Exercise 6: 
  Write an algorithm for computing the integrals
    I_n = integral from 0 to 1 of (x^n * e^(x-1)) dx, for n = 1, 2, ...
  
  using the recurrence relation I_n = F(I_{n-1}), n = 2, 3, ...
  where I_1 = 1/e.
  
  Do calculations in single and double precision and compute I_ns for 
  n = 2 to n = 20. Explain the results.
  
  Hint: Find the recursive function F using integration by parts.


Answer:
See the ex6.md file for the calculations.
*)

let rec findIntegral (n: int) =
  if n = 1 then 1. /. exp 1.0
  else 1. -. (float_of_int n) *. findIntegral (n - 1);;


let integral = 
  for i = 2 to 20 do
  Printf.printf "Finding the integral for n = %d : %f\n" i (findIntegral i)
  done

let () = 
integral

(*
THe output for this code is:
Finding the integral for n = 2 : 0.264241
Finding the integral for n = 3 : 0.207277
Finding the integral for n = 4 : 0.170893
Finding the integral for n = 5 : 0.145533
Finding the integral for n = 6 : 0.126802
Finding the integral for n = 7 : 0.112384
Finding the integral for n = 8 : 0.100932
Finding the integral for n = 9 : 0.091612
Finding the integral for n = 10 : 0.083877
Finding the integral for n = 11 : 0.077352
Finding the integral for n = 12 : 0.071773
Finding the integral for n = 13 : 0.066948
Finding the integral for n = 14 : 0.062731
Finding the integral for n = 15 : 0.059034
Finding the integral for n = 16 : 0.055459
Finding the integral for n = 17 : 0.057192
Finding the integral for n = 18 : -0.029454
Finding the integral for n = 19 : 1.559620
Finding the integral for n = 20 : -30.192395

Which gives us huge negative number for n = 20, because the formula I_n = 1 - n * I_(n-1)
amplifies the error by multiplying it by n and since we are subtracting it from 1, it goes in minus.


We can try to write this code with the provided, more accurate formula:
*)

let integral1 = 1. /. exp 1.0

let fact n k = 
  let rec helper n k acc =
  match k with
  | 0 -> acc
  | _ -> helper (n-1) (k-1) (acc *. float_of_int n)
  in helper n k 1.0

let sum n =
  let s = ref 0.0 in
  for i = 0 to (n-2) do
    let sign = if i mod 2 = 0 then 1.0 else -1.0 in
    s := !s +. (sign *. (fact n i)) 
  done;
  !s

let result n =
  let sign = if (n-1) mod 2 = 0 then 1.0 else -1.0 in 
  (sum n) +. sign *. (fact n n) *. integral1

let solution = 
  for i = 2 to 20 do
  Printf.printf "Solution integral for n = %d : %f\n" i (result i)
  done

let () = 
solution


(*
Solution integral for n = 2 : 0.264241
Solution integral for n = 3 : 0.207277
Solution integral for n = 4 : 0.170893
Solution integral for n = 5 : 0.145533
Solution integral for n = 6 : 0.126802
Solution integral for n = 7 : 0.112384
Solution integral for n = 8 : 0.100932
Solution integral for n = 9 : 0.091612
Solution integral for n = 10 : 0.083877
Solution integral for n = 11 : 0.077352
Solution integral for n = 12 : 0.071773
Solution integral for n = 13 : 0.066948
Solution integral for n = 14 : 0.062733
Solution integral for n = 15 : 0.059021
Solution integral for n = 16 : 0.055664
Solution integral for n = 17 : 0.062500
Solution integral for n = 18 : 0.000000
Solution integral for n = 19 : 0.000000
Solution integral for n = 20 : 0.000000

Even in the case of the more accurate formula, we still do not get the accurate results, 
this is because when calculating huge factorials, the precision is lost, and this loss is even 
bigger if we calculate it with single-precision.
*)