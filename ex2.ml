(* 
Write an algorithm and a code to solve the quadratic equation  
ax2 + bx + c = 0, 
where  a,  b,  c  are  real  numbers.  Prepare  your  code  to  perform  both  single  and  double  precision 
calculations. 
 *)



let solve_quadratic (a: float) (b: float) (c: float) : (float * float) option = 
  if a = 0. then
    None (* It's not a quadratic equation*)
  else
    let discriminant = b *. b -. 4. *. a *. c in
    if discriminant < 0. then
      None (*the function does not have any roots*)
    else if discriminant = 0. then
      let x = -.b /. (2. *. a) in
      Some (x, x)
    else
      let x1 = (-.b +. sqrt discriminant) /. (2. *. a) in
      let x2 = (-.b -. sqrt discriminant) /. (2. *. a) in
      Some (x1, x2)

let test a b c =
  match solve_quadratic a b c with
  | None -> print_string "No real roots\n"
  | Some (x1, x2) -> Printf.printf "Roots: %.2f, %.2f\n" x1 x2

let () =
  test 0. 2. 3.;
  test 1. 2. 5.;
  test 1. (-4.) 4.;
  test 1. (-5.) 6.;