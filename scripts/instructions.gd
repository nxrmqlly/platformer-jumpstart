extends Node

@onready var start_panel: Panel = $StartPanel

func _ready() -> void:
	start_panel.show()

func _on_start_button_pressed() -> void:
	queue_free()
