(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   leibniz_pi.ml                                      :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: jaguillo <jaguillo@student.42.fr>          +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/16 11:14:47 by jaguillo          #+#    #+#             *)
(*   Updated: 2015/06/16 13:52:14 by jaguillo         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let leibniz_pi delta =
	let pi4 = atan 1.
	let rec plus pi div it =
		let d = pi -. pi4 in
		if d > (0. -. delta) && d < delta then
			it
		else
			less pi4 (pi +. (1. /. div)) (div +. 2.) (it + 1)
	and less pi div it =
		let d = pi -. pi4 in
		if d > (0. -. delta) && d < delta then
			it
		else
			plus pi4 (pi -. (1. /. div)) (div +. 2.) (it + 1)
	in
	if delta <= 0. then
		-1
	else
		less 1. 3. 0

(*
** Test
*)
let () =
	print_int (leibniz_pi 0.0001); print_char '\n';
