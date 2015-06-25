(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   alkane_combustion.ml                               :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: jaguillo <jaguillo@student.42.fr>          +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/25 17:17:13 by jaguillo          #+#    #+#             *)
(*   Updated: 2015/06/25 18:48:16 by jaguillo         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let rec molecules_of_alkanes alkanes ((c,h) as acc) =
	match alkanes with
	| []					-> acc
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

class alkane_combustion __alkanes = object
	inherit Reaction.reaction
	val _mols = molecules_of_alkanes __alkanes (0, 0)
	method get_start = []
	method get_result = []
	method balance =
		let _c, _h = _mols in
		let lol = ppcm 4 _c in
		Printf.printf "%d\n" lol;
		({<  >} :> Reaction.reaction)
	method is_balanced = false
end

(*
** Test
*)

let () = ignore((new alkane_combustion [new Alkane.hexane])#balance)
