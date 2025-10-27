extends Node2D

var atack_range = 100
@export var attack_ability: PackedScene


func _on_timer_timeout():
	var player = get_tree().get_first_node_in_group('player') as Node2D
	if player == null:
		return
		
	var player_pos = player.global_position
	
	var enemys = get_tree().get_nodes_in_group("enemy")
	
	enemys = enemys.filter(func(enemy:Node2D): 
		return enemy.global_position.distance_squared_to(player_pos) < pow(atack_range, 2)
	)
	
	if enemys.size() == 0:
		return
	
	enemys.sort_custom(func(a:Node2D, b:Node2D):
		var a_distance = a.global_position.distance_squared_to(player_pos)
		var b_distance = b.global_position.distance_squared_to(player_pos)
		return a_distance < b_distance
	)
	
	var enemy_pos = enemys[0].global_position
	
	var atack_instance = attack_ability.instantiate() as Node2D
	player.get_parent().add_child(atack_instance)
	atack_instance.global_position = (enemy_pos + player_pos)/2
	
	atack_instance.look_at(enemy_pos)
