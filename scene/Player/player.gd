extends CharacterBody2D

const max_speed = 125
const acceleration = 0.15
@onready var _animated_sprite = $AnimatedSprite2D

func _process(delta):
	var movement = movement_vector()
	var direction = movement.normalized()
	velocity = max_speed * direction
	move_and_slide()
	
	if Input.is_action_pressed("move_right"):
		_animated_sprite.play("run_right")
	elif Input.is_action_pressed("move_left"):
		_animated_sprite.play("run_left")
	#elif Input.is_action_pressed("move_ap"):
		#_animated_sprite.play("run_ap")
	else:
		_animated_sprite.play("idle")

func movement_vector():
	var movement_x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	var movement_y = Input.get_action_strength("move_dawn") - Input.get_action_strength("move_ap")
	return Vector2(movement_x, movement_y)
	
