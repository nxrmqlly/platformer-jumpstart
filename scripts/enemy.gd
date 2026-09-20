extends RigidBody2D

@onready var game_mgr: Node = %GameMgr

func _on_area_2d_body_entered(body: Node2D) -> void:
	if (body.name == "Player"):
		var y_delta = global_position.y - body.global_position.y
		var x_delta = body.global_position.x - global_position.x
		
		print(y_delta)
		if (y_delta > 30):
			print("destr en")
			game_mgr.reduce_enemy()
			queue_free()
			body.jump()
		else:
			print("rem plr hel")
			game_mgr.decrease_health()
			
			if (x_delta > 0):
				body.jump_side(500)
			else:
				body.jump_side(-500)
			
