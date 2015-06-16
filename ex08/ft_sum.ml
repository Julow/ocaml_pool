(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ft_sum.ml                                          :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: jaguillo <jaguillo@student.42.fr>          +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/16 11:00:10 by jaguillo          #+#    #+#             *)
(*   Updated: 2015/06/16 11:06:32 by jaguillo         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let rec ft_sum e min max =
	let rec lol i acc =
		if i > max then
			acc
		else
			lol (i + 1) (acc +. (e i))
	in
	lol min 0.

(*
** Test
*)
let () =
	print_float (ft_sum (fun i -> float_of_int (i * i)) 1 10); print_char '\n';
	print_float (ft_sum (fun i -> float_of_int i) 1 10); print_char '\n';
	print_float (ft_sum (fun i -> 1.) 1 10); print_char '\n';
