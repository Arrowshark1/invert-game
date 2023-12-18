extends CharacterBody2D

@export var speed = 0.0
@export var def_speed = 100.0
var effect_vec = Vector2(0,0)
var has_choanocyte = false

var room = null 

func _ready():
	set_room(null)
	$AnimationPlayer.play("PedalWave")
	if CrossSceneConsistnecy.has_c:
		$MiniChoanocyte.visible = true
		def_speed = 200.0
		has_choanocyte = true
		
func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_Z:
			if room != null:
				get_tree().change_scene_to_packed(room)
	
func _physics_process(delta):
	#look_at(get_global_mouse_position())
	var vec2mouse = global_position - get_global_mouse_position()
	
	global_rotation = lerp_angle(global_rotation, vec2mouse.angle(), 0.08)
	if Input.is_action_pressed("boost") && $Timer.is_stopped():
		speed = lerp(speed, def_speed*5.0, 0.7)
		$Timer.start()
	if Input.is_action_pressed("swim"):
		speed = lerp(speed, def_speed, 0.1)
	else:
		speed = lerp(speed, 0.0, 0.05)
	velocity = -transform.x*speed
	velocity += effect_vec
	move_and_slide()
	
func add_velocity(v_vec : Vector2):
	effect_vec = v_vec
	
func reset_velocity():
	effect_vec = Vector2(0,0)
	
func set_room(r):
	room = r
	if room != null:
		$Control/Prompt.show()
	else: 
		$Control/Prompt.hide()
		
func take(object : String):
	if object == "Choanocyte" && has_choanocyte == false:
		$MiniChoanocyte.visible = true
		def_speed = 200.0
		CrossSceneConsistnecy.has_c = true
		
