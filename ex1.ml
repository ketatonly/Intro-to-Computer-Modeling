(*
  Exercise 1: Write an algorithm for evaluating a polynomial
    P_n(x) = a_n*x^n + a_{n-1}*x^{n-1} + ... + a_1*x + a_0

  Goal: Compute its value for a given x = x_0.

  Hint: Use Horner's method (factored form):
    P_n(x) = (((...(a_n*x + a_{n-1})*x + a_{n-2})*x + ... + a_3)*x + a_2)*x + a_1)*x + a_0

  Show that direct calculations involve n (n + 1)/2 multiplications and n additions. Compare these 
  numbers to the numbers of the corresponding arithmetic operations required in your algorithm. 


  The answer:
  In case of a direct calculation, we have n coefficients. For i, where 0<=i<=n, we have to calculate a_i*x^i.
 This requires i multiplications and 1 addition. So, the total number of multiplications is
 0+1+2+...+n = n(n+1)/2 and the total number of additions is n.

 But in the case of Horner's method, for each i, where 0<=i<=n, we have to calculate a_i*x + a_{i-1}. 
 This requires 1 multiplication and 1 addition. So, the total number of multiplications is n 
 and the total number of additions is n.
*)


(*if the convension is lowest degree first*)
let polylow (const : float list) (x : float) : float = 
      let rev = List.rev const 
    in
    match rev with
    | [] -> 0.
    | an::tail -> 
      let rec helper lst acc = 
        match lst with 
        | [] -> acc
        | h::t -> helper t (acc*.x +. h)
      in helper tail an;;



(*if the convension is highest degree first*)
let polyhigh (const : float list) (x : float) : float = 
  match const with
  | [] -> 0.
  | an::tail -> 
      let rec helper lst acc = 
        match lst with 
        | [] -> acc
        | h::t -> helper t (acc*.x +. h)
      in helper tail an;;


let () = 
  print_float (polylow [1.; 2.; 3.] 2.); (* should print 17. *)
  print_newline ();
  print_float (polyhigh [1.; 2.; 3.] 2.); (* should print 11. *)
  print_newline ();


