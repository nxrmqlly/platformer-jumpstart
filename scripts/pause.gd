extends Node

@onready var pause_panel: Panel = %PausePanel

func _process(delta: float) -> void:
	var esc_pressed = Input.is_action_just_pressed("pause")
	if (esc_pressed):
		get_tree().paused = true
		pause_panel.show()

func _on_resume_pressed() -> void:
	get_tree().paused = false
	pause_panel.hide()

func _on_exit_pressed() -> void:
	get_tree().paused = false
	get_tree().quit()
