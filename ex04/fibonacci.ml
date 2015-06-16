(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   fibonacci.ml                                       :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: jaguillo <jaguillo@student.42.fr>          +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/16 10:10:39 by jaguillo          #+#    #+#             *)
(*   Updated: 2015/06/16 10:26:02 by jaguillo         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let fibonacci n =
	let rec lol n acc =
		if n < 0 then
			-1
		else if n <= 1 then
			n + acc
		else
			lol (n - 2) (lol (n - 1) acc)
	in
	lol n 0

(*
** Test
*)
let () =
	print_int (fibonacci (-42)); print_char '\n';
	print_int (fibonacci 1); print_char '\n';
	print_int (fibonacci 2); print_char '\n';
	print_int (fibonacci 3); print_char '\n';
	print_int (fibonacci 4); print_char '\n';
	print_int (fibonacci 5); print_char '\n';
	print_int (fibonacci 6); print_char '\n';
	print_int (fibonacci 7); print_char '\n';
	print_int (fibonacci 8); print_char '\n';
	print_int (fibonacci 9); print_char '\n';
	print_int (fibonacci 10); print_char '\n';
	print_int (fibonacci 11); print_char '\n';
	print_int (fibonacci 12); print_char '\n';
	print_int (fibonacci 13); print_char '\n';
	print_int (fibonacci 14); print_char '\n';
	print_int (fibonacci 15); print_char '\n'
