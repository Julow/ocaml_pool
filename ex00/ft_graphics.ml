(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ft_graphics.ml                                     :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: jaguillo <jaguillo@student.42.fr>          +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/18 13:04:30 by jaguillo          #+#    #+#             *)
(*   Updated: 2015/06/18 15:22:40 by jaguillo         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

type 'a tree = Nil | Node of 'a * 'a tree * 'a tree

let draw_square x y size =
	let x' = size / 2 + x in
	let y' = size / 2 + y in
	Graphics.moveto x' y';
	Graphics.lineto (x' + size) y';
	Graphics.lineto (x' + size) (y' + size);
	Graphics.lineto x' (y' + size);
	Graphics.lineto x' y'

let draw_tree_node node =
	let draw_node str x y =
		draw_square x y 30;
		Graphics.moveto x y;
		Graphics.draw_string str
	in
	let draw_line (x1, y1) (x2, y2) =
		Graphics.moveto x1 y1;
		Graphics.lineto x2 y2
	in
	match node with
	| Nil				-> draw_node "Nil" 75 50
	| Node (a, _, _)	->
		draw_node a 50 50;
		draw_node "Nil" 100 25;
		draw_node "Nil" 100 75;
		draw_line (50 + 15, 50) (100 - 15, 25);
		draw_line (50 + 15, 50) (100 - 15, 75)

(*
** Test
*)
let () =
	Graphics.open_graph " 150x200";
	draw_tree_node (Node ("", Nil, Nil))
