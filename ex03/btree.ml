(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   btree.ml                                           :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: jaguillo <jaguillo@student.42.fr>          +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/19 11:04:22 by jaguillo          #+#    #+#             *)
(*   Updated: 2015/06/19 12:49:25 by jaguillo         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

type 'a tree = Nil | Node of 'a * 'a tree * 'a tree

let max a b = if a < b then b else a
let abs a = if a < 0 then (-a) else a

let rec height = function
	| Nil					-> 1
	| Node (_, Nil, Nil)	-> 2
	| Node (_, a, Nil)		-> 1 + (height a)
	| Node (_, Nil, b)		-> 1 + (height b)
	| Node (_, a, b)		-> 1 + (max (height a) (height b))

let rec is_bst = function
	| Nil											-> true
	| Node (_, Nil, Nil)							-> true
	| Node (v, (Node (v', _, _) as a), (Node (v'', _, _) as b))	->
		(v' < v) && (v > v'') && (is_bst a) && (is_bst b)
	| Node (v, (Node (v', _, _) as a), Nil)			-> (v > v') && (is_bst a)
	| Node (v, Nil, (Node (v', _, _) as b))			-> (v < v') && (is_bst b)

let is_balanced t =
	let t_balanced = function
		| Nil					-> true
		| Node (_, a, b)		-> (abs ((height a) - (height b))) <= 1
	in
	(t_balanced t) && (is_bst t)

let rec is_perfect = function
	| Nil											-> true
	| Node (_, a, b) when (height a) = (height b)	-> (is_perfect a) && (is_perfect b)
	| _												-> false

let rec search_bst t v =
	match t with
	| Nil							-> false
	| Node (v', a, b) when v' = v	-> true
	| Node (v', a, b) when v' > v	-> search_bst a v
	| Node (v', a, b)				-> search_bst b v

let rec add_bst t v =
	match t with
	| Nil							-> Node (v, Nil, Nil)
	| Node (v', _, _) when v' = v	-> failwith "Already exists"
	| Node (v', a, b) when v' > v	-> Node (v', (add_bst a v), b)
	| Node (v', a, b)				-> Node (v', a, (add_bst b v))

let rec min_bst = function
	| (Node (_, Nil, _) as a)		-> a
	| Node (_, a, _)				-> min_bst a
	| _								-> Nil

let rec merge_dst a b v =
	match (a, b) with
	| (a', Nil)							-> a'
	| (Nil, b')							-> b'
	| _									->
		match (min_bst b) with
		| Nil					-> failwith "Not bst"
		| Node (v, _, _)		-> Node (v, a, delete_bst b v)

and delete_bst t v =
	match t with
	| Node (v', Nil, Nil) when v' <> v	-> Nil
	| Node (v', a, b) when v' = v		-> merge_dst a b v
	| Node (v', a, b) when v' > v		-> Node (v', delete_bst a v, b)
	| Node (v', a, b)					-> Node (v', a, delete_bst b v)
	| _									-> failwith "Does not exists"

(*
** Test
*)
let () =
	print_string "lol\n"
