(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   reaction.ml                                        :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: jaguillo <jaguillo@student.42.fr>          +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/25 16:44:58 by jaguillo          #+#    #+#             *)
(*   Updated: 2015/06/25 17:16:35 by jaguillo         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

class virtual reaction = object
	method virtual get_start : (Molecule.molecule * int) list
	method virtual get_result : (Molecule.molecule * int) list
	method virtual balance : reaction
	method virtual is_balanced : bool
end
