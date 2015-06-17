(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   crossover.ml                                       :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: jaguillo <jaguillo@student.42.fr>          +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/17 11:09:42 by jaguillo          #+#    #+#             *)
(*   Updated: 2015/06/17 11:21:29 by jaguillo         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let rec list_contains l1 e =
	match l1 with
	| [] -> false
	| head::tail when head = e -> true
	| head::tail -> list_contains tail e

let rec crossover l1 l2 =
	match l1 with
	| [] -> []
	| head::tail when list_contains l2 head -> head :: crossover tail l2
	| head::tail -> crossover tail l2

(*
** Test
*)
let rec printlist l =
	match l with
	| [] -> print_char '\n'
	| head::sec::tail -> print_int head; print_string ", "; printlist (sec :: tail)
	| head::tail -> print_int head; printlist tail

let () =
	printlist (crossover [1; 2; 3; 4; 5; 6] [2; 2; 8; 4]);
	printlist (crossover [1; 2; 3; 4; 5; 6] [7; 8; 9; 10]);
	printlist (crossover [2; 2; 3; 3; 4; 4] [2; 4]);
	printlist (crossover [2; 2; 3; 3; 4; 4] [2; 4; 4]);
	printlist (crossover [] [1; 2; 5; 3; 7; 4]);
	printlist (crossover [1; 2; 5; 3; 7; 4] []);
