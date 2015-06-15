(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ft_print_comb.ml                                   :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: jaguillo <jaguillo@student.42.fr>          +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/15 14:11:06 by jaguillo          #+#    #+#             *)
(*   Updated: 2015/06/15 14:40:36 by jaguillo         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let ft_print_comb () =
	let rec comb_a a =
		let rec comb_b b =
			let rec comb_c c =
				if c <= 9 then begin
					print_int a;
					print_int b;
					print_int c;
					print_string (if a >= 7 then "\n" else ", ");
					comb_c (c + 1)
				end;
			in
			if b < 9 then begin
				comb_c (b + 1);
				comb_b (b + 1)
			end;
		in
		if a <= 9 then begin
			comb_b (a + 1);
			comb_a (a + 1)
		end;
	in
	comb_a 0

(*
** Test
*)
let () =
 for i=0 to 100000 do
   ft_print_comb ()
 done;
 print_newline()
