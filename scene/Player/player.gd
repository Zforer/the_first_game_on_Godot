extends CharacterBody2D

const max_speed = 125
const acceleration = 0.15


func _process(delta):
	var movement = movement_vector()
	var direction = movement.normalized()
	velocity = max_speed * direction
	move_and_slide()


func movement_vector():
	var movement_x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	var movement_y = Input.get_action_strength("move_dawn") - Input.get_action_strength("move_ap")
	return Vector2(movement_x, movement_y)
	
