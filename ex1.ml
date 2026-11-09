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