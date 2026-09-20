extends Node2D

@onready var game_mgr: Node = %GameMgr

func _on_area_2d_body_entered(body: Node2D) -> void:
	if (body.name == "Player"):
		game_mgr.key_acquired()
		queue_free()
