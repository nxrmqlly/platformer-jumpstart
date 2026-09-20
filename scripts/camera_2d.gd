extends Camera2D

@onready var level_tml: TileMapLayer = %LevelTML

func _ready() -> void:
	position = Vector2.ZERO
	
	var map_rect: Rect2i = level_tml.get_used_rect()
	var tile_size: int = level_tml.tile_set.tile_size.x
	
	var tml_scale: int = 4
	
	limit_left = map_rect.position.x * tile_size * tml_scale
	limit_top = map_rect.position.y * tile_size * tml_scale
	limit_right = map_rect.end.x * tile_size * tml_scale
	limit_bottom = map_rect.end.y * tile_size * tml_scale
	
	drag_horizontal_enabled = true
	drag_vertical_enabled = true
	drag_left_margin = 0.2
	drag_right_margin = 0.2
	drag_top_margin = 0.2
	drag_bottom_margin = 0.2
	
	position_smoothing_enabled = true
	position_smoothing_speed = 5.0
	process_callback = Camera2D.CAMERA2D_PROCESS_PHYSICS
	
	reset_smoothing()

func _process(_delta: float) -> void:
	global_position = global_position.round()
