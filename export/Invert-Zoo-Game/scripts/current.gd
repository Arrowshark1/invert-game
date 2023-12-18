extends Area2D

@export var current_strength = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if(body.is_in_group("player")):
		body.add_velocity(($Marker2D.global_position - global_position).normalized()*current_strength)
		
func _on_body_exited(body):
	if(body.is_in_group("player")):
		body.reset_velocity()
