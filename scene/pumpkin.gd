extends CharacterBody2D

var max_speed = 50

func _process(delta):
	var direction = get_direction_to_player()
	
	if direction != Vector2.ZERO:
		velocity = max_speed * direction
		if direction.x > 0:
			play_animation("run_right")
		elif direction.x < 0:
			play_animation("run_left")
	else:
		velocity = Vector2.ZERO
	
	move_and_slide()


func get_direction_to_player() -> Vector2:
	var player = get_tree().get_first_node_in_group("player") as Node2D
	if player:
		return (player.global_position - global_position).normalized()
	else:
		return Vector2.ZERO


func play_animation(anim_name):
	var anim_sprite = $AnimatedSprite2D
	if anim_sprite and anim_sprite.animation != anim_name:
		anim_sprite.play(anim_name)


func _on_area_2d_area_entered(area):
	queue_free()
