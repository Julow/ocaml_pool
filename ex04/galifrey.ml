(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   galifrey.ml                                        :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: jaguillo <jaguillo@student.42.fr>          +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/24 18:18:51 by jaguillo          #+#    #+#             *)
(*   Updated: 2015/06/24 18:43:56 by jaguillo         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

class galifrey = object
	val daleks = (new Army.army:Dalek.dalek Army.army)
	val doctors = (new Army.army:Doctor.doctor Army.army)
	val peoples = (new Army.army:People.people Army.army)

	method do_time_war = ()
end
