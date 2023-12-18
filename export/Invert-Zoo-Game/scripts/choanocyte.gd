extends StaticBody2D

var pickable = false
var player = null
# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("exist")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_C and pickable and player:
			player.take("Choanocyte")
			$CollisionShape2D.disabled = true
			$TakeArea/CollisionShape2D.disabled = true
			get_tree().queue_delete(self) 
	
func _on_take_area_body_entered(body):
	if body.is_in_group("player"):
		player = body
		pickable = true


func _on_take_area_body_exited(body):
	if body.is_in_group("player"):
		player = null
		pickable = false
