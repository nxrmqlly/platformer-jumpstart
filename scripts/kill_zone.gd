extends Area2D

@export var spawn_point: Vector2 = Vector2(128, 100) 

func _on_body_entered(body: Node2D) -> void:
	if "Player" in body.name:
		teleport_player(body)

func teleport_player(player_node: Node2D) -> void:
	player_node.global_position = spawn_point
	
	if "velocity" in player_node:
		player_node.velocity = Vector2.ZERO
