(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   alkane_combustion.ml                               :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: jaguillo <jaguillo@student.42.fr>          +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/25 17:17:13 by jaguillo          #+#    #+#             *)
(*   Updated: 2015/06/26 15:17:54 by jaguillo         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let rec molecules_of_alkanes alkanes (c,h) =
	match alkanes with
	| []					-> c, h
	| head::tail			->
		let n = head#n in
		molecules_of_alkanes tail ((c + n), (n * 2 + 2 + h))

let ppcm a b =
	let rec loop acc_a acc_b =
		let a' = acc_a * a in
		let b' = acc_b * b in
		if a' = b' then
			a'
		else if a' < b' then
			loop (acc_a + 1) acc_b
		else
			loop acc_a (acc_b + 1)
	in
	loop 1 1

let rec lol_start (alkanes:(Molecule.molecule) list) acc =
	match alkanes with
	| []				-> acc
	| head::tail		-> begin
		match acc with
		| (prev,n)::next when head#equals prev	-> lol_start tail ((prev, (n + 1))::next)
		| _										-> lol_start tail ((head, 1)::acc)
	end

class alkane_combustion (__alkanes:Alkane.alkane list) = object
	inherit Reaction.reaction [] []
	val _init = molecules_of_alkanes __alkanes (0, 0)
	val _start :((Molecule.molecule * int) list) = lol_start (__alkanes :> Molecule.molecule list) []
	val _result :((Molecule.molecule * int) list) = []
	val _balanced = false
	method get_start = if _balanced then _start else failwith "Not balanced"
	method get_result = if _balanced then _result else failwith "Not balanced"
	method balance =
		let rec balance_left f diox =
			let rec loop l =
				match l with
				| []									-> []
				(* | (mol, _)::tl when mol#formula = "O2"	-> (mol, diox)::(loop tl) *)
				| (mol, n)::tl							-> (mol, n * f)::(loop tl)
			in
			loop _start
		and balance_right dcarbon water =
			[(new Molecule.carbon_dioxyde, dcarbon); (new Molecule.water, water)]
		in
		let _c, _h = _init in
		let dcarbon = ppcm 4 _c in
		let fact = dcarbon / _c in
		let water = _h * fact / 2 in
		let diox = water / 2 + dcarbon in
		({< _start = balance_left fact diox ; _result = balance_right dcarbon water ; _balanced = true >} :> Reaction.reaction)
	method is_balanced = _balanced
end

(*
** Test
*)

let rec print_molecules = function
| []				-> ()
| (m,n)::tail		->
	print_int n;
	print_string (m#formula);
	print_molecules tail

let rec print_alkanes = function
| []				-> ()
| head::tail		->
	print_string (head#formula);
	print_alkanes tail

let test start =
	print_alkanes start;
	print_string " ----> ";
	let r = (new alkane_combustion start)#balance in
	print_molecules (r#get_start);
	print_string " = ";
	print_molecules (r#get_result);
	print_newline ()

let () =
	test [new Alkane.methane];
	test [new Alkane.methane;new Alkane.butane;];
	test [new Alkane.methane;new Alkane.butane;new Alkane.undecane;];
