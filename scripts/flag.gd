extends Node2D

@onready var game_mgr: Node = %GameMgr
@export var win_panel: Node

func _on_area_2d_body_entered(body: Node2D) -> void:
	if (game_mgr.has_key == true and game_mgr.enemies == 0):
		get_tree().paused = true
		win_panel.show()
