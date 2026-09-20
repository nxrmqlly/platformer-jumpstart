extends Node

var lives = 3
var enemies = 3
var has_key = false

@export var enemy_icons: Array[Node]
@export var hearts: Array[Node]

func key_acquired():
	has_key = true

func reduce_enemy():
	enemies -= 1
	print("lives left: " + str(lives))
	for i in 3:
		if (i < enemies):
			enemy_icons[i].show()
		else:
			enemy_icons[i].hide()
	if (lives == 0):
		pass

func decrease_health():
	lives -= 1
	print("lives left: " + str(lives))
	for h in 3:
		if (h < lives):
			hearts[h].show()
		else:
			hearts[h].hide()
	if (lives == 0):
		get_tree().reload_current_scene()
