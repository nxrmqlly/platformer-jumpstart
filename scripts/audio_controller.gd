extends Node

@onready var bg_music: AudioStreamPlayer = $BgMusic

@export var mute = false:
	set(value):
		mute = value
		var bus_index = AudioServer.get_bus_index("Master")
		AudioServer.set_bus_mute(bus_index, mute)

func _ready() -> void:
	bg_music.play()
