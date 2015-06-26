(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   watchover.ml                                       :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: jaguillo <jaguillo@student.42.fr>          +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/26 15:24:03 by jaguillo          #+#    #+#             *)
(*   Updated: 2015/06/26 15:33:50 by jaguillo         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

type hour = int

let zero:hour = 0

let add a b :hour = abs ((a + b) mod 12)

let sub a b :hour = abs ((a - b) mod 12)

let to_int (a:hour) = a
