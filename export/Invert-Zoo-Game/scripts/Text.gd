extends Area2D

@export var text : String 

func  _ready():
	$Label.visible = false
	$Label.text = text
	

func _on_body_entered(body):
	if body.is_in_group("player"):
		$Label.visible = true
	


func _on_body_exited(body):
	if body.is_in_group("player"):
		$Label.visible = false
