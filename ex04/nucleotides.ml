(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   nucleotides.ml                                     :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: jaguillo <jaguillo@student.42.fr>          +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/17 18:27:48 by jaguillo          #+#    #+#             *)
(*   Updated: 2015/06/17 18:46:18 by jaguillo         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

type phosphate = string
type deoxyribose = string
type nucleobase = A | T | C | G | None
type nucleotide = phosphate * deoxyribose * nucleobase

let generate_nucleotide base:nucleotide =
	match base with
	| 'A' -> "phosphate", "deoxyribose", A
	| 'T' -> "phosphate", "deoxyribose", T
	| 'C' -> "phosphate", "deoxyribose", C
	| 'G' -> "phosphate", "deoxyribose", G
	| _ -> "phosphate", "deoxyribose", None
