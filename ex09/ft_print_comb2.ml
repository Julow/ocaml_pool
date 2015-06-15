(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ft_print_comb2.ml                                  :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: jaguillo <jaguillo@student.42.fr>          +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/15 17:27:50 by jaguillo          #+#    #+#             *)
(*   Updated: 2015/06/15 17:38:15 by jaguillo         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let print_num n =
	print_char ',';
	print_char ' ';
	if n < 10 then
		print_char '0';
	print_int n

let rec comb_b a b first =
	if b < 99 then begin
		if first then begin
			print_char '0';
			print_char '0';
		end else
			print_num a;
		print_num b;
		comb_b a (b + 1) false
	end

let rec comb_a a first =
	if a < 99 then begin
		comb_b a 0 first;
		comb_a (a + 1) false
	end

let ft_print_comb2 () = comb_a 0 true; print_char '\n'

(*
** Test
*)
let () = ft_print_comb2 ()
