(* 
Compare the convergence rate of the bisection method with that of Newton’s method  
for the equation :
x3 − 2x + 2 = 0. 

In Newton's method, take the initial guess for the root as 1.1, follow the iteration  
process and explain the results.
*)

(* 
Implementation for bisection method:
1. Read a, b and e 
2. Initialize xL and xR 
3. Compute maximum bisections n from Inequality 2 
4. Repeat n times: 
  Compute xM according to Equation 1: 
  If f(xL)f(xM) > 0 then 
  Let xL = xM 
  otherwise 
  Let xR = xM 
5. Print root xM 
6. Stop.
*)

(* 
Answer: 
The convergence rate of the Bisection method is much slower than Newton's method. 
Bisection exhibits linear convergence (the error roughly halves at each step), 
whereas Newton's method exhibits quadratic convergence (the number of correct digits roughly doubles 
at each step).

However, Newton's method is highly dependent on the initial guess. If the guess is not chosen carefully, 
the sequence can oscillate indefinitely or diverge. As seen in our output for 
x_0 = 1.1, 
the derivative is small near this point, causing the method to bounce wildly between positive and negative 
values and fail to find the actual root (−1.769) within 20 steps.

By contrast, if we choose an initial guess closer to the root (e.g., x_0 = −1.5, 
which is inside the initial bisection interval), Newton's method converges in just 3 steps. 
This perfectly demonstrates that while Newton's method is incredibly fast, the Bisection method is far 
more robust because it is guaranteed to find a root as long as the function changes sign.
*)




let funct x = x ** 3.0 -. 2.0 *. x +. 2.0

let bisectionError a b e =
  let numerator = log (abs_float (a -. b) /. e) in
  let denominator = log 2.0 in
  let n = numerator /. denominator in
int_of_float (ceil n) 

let bisection (a: float) (b: float) (e: float)= 
  let steps = bisectionError a b e in

  let (l, r) =
    if funct a = funct b then failwith "You need to choose different bounds where the function changes sign"
  else if funct a < funct b then 
    (a, b)
  else 
    (b, a)
  in

  let rec loop a b n = 
    let m = (a +. b) /. 2.0 in
    Printf.printf "Bisection step %d: x = %f, error = %f\n" n m ((abs_float (a -. b) /. 2.0));

    if n >= steps then 
      Printf.printf "Bisection final root: %f\n" m 
    else if funct m *. funct a > 0.0 then 
      loop m b (n+1)
    else 
      loop a m (n+1)
in 
loop l r 1

let () =
  Printf.printf "--- Testing Bisection Method ---\n";
  bisection (-2.0) (-1.0) 0.0001 ;
  Printf.printf "Done!\n"


(* Newton's method: *)
(*
Implementation:
1. Read in starting value x_0 and required accuracy e
2. While |f(xk)| ≥ e, repeat up to k = 20, say:
  x_{k+1} = x_k - f(x)/f'(x)
 Print x_{k+1} and f (x+{k+1})
 3. Stop 
*)

let der x = 3.0 *. x ** 2.0 -. 2.0

let newton (a: float) (e: float) = 
  let rec loop x n =
    if abs_float (funct x) < e || n > 20 then 
      Printf.printf "Newton final root: x = %f\n" x
    else begin
      Printf.printf "Newton step %d: x = %f, error = %f\n" n x (abs_float (funct x));
      let next = x -. (funct x) /. (der x) in 
      loop next (n+1)
    end
in
loop a 1

let () =
  Printf.printf "--- Testing Newton's Method ---\n";
  newton (-1.5) 0.0001 ;
  Printf.printf "Done!\n";
  Printf.printf "--- Testing Newton's Method ---\n";
  newton (1.1) 0.0001 ;
  Printf.printf "Done!\n"