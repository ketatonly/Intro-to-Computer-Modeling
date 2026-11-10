(* 
Write an algorithm and a code to solve the quadratic equation  
ax2 + bx + c = 0, 
where  a,  b,  c  are  real  numbers.  Prepare  your  code  to  perform  both  single  and  double  precision 
calculations. 
 *)


 type number =
  | Int of int 
  | Single of int32
  | Double of float

let toFloat (n : number) : float =
  match n with
  | Int i -> float_of_int i
  | Double d -> d
  | Single s -> Int32.to_float s  

let solve_quadratic (a: number) (b: number) (c: number) : (float * float) option = 
  let a = toFloat a in
  let b = toFloat b in
  let c = toFloat c in
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
  test (Int 1) (Int (-5)) (Int 6);
  test (Double 1.0) (Double (-4.0)) (Double 4.0);
  test (Single (Int32.of_int 1)) 
       (Single (Int32.of_int (-2))) 
       (Single (Int32.of_int 0));