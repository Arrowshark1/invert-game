extends Node2D


@export var world1 = preload("res://enviornment/world1.tscn")

func _on_grow_area_body_entered(body):
	if body.is_in_group("player"):
		body.set_room(world1)


func _on_grow_area_body_exited(body):
	if body.is_in_group("player"):
		body.set_room(null)
