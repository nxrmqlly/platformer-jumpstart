extends TileMapLayer

@onready var parallax_node: Parallax2D = get_parent()

const SOURCE_ID = 1         # ID of tileset src
const TOP_ROW_Y = 0         # Y of top row
const MIDDLE_ROW_Y = 1      # Y of  middle row
const BOTTOM_ROW_Y = 2      # Y of bottom row

const TOTAL_VARIATIONS = 4 

func _ready() -> void:
	var viewport_size = get_viewport_rect().size
	var tile_size = tile_set.tile_size.x # 24px
	
	var tiles_needed_x = ceil(viewport_size.x / tile_size) + 4
	var tiles_needed_y = ceil(viewport_size.y / tile_size) + 4
	
	randomize()
	
	for x in range(tiles_needed_x):
		var random_variation_x = randi() % TOTAL_VARIATIONS
		set_cell(Vector2i(x, 0), SOURCE_ID, Vector2i(random_variation_x, MIDDLE_ROW_Y))	
		
		var top_atlas_x = x % TOTAL_VARIATIONS 
		for y_up in range(1, tiles_needed_y):
			set_cell(Vector2i(x, -y_up), SOURCE_ID, Vector2i(top_atlas_x, TOP_ROW_Y))
			
		var bottom_atlas_x = x % TOTAL_VARIATIONS
		for y_down in range(1, tiles_needed_y):
			set_cell(Vector2i(x, y_down), SOURCE_ID, Vector2i(bottom_atlas_x, BOTTOM_ROW_Y))

	if parallax_node:
		var total_width_pixels = tiles_needed_x * tile_size
		
		parallax_node.scroll_scale = Vector2(0.05, 1.0)
		parallax_node.repeat_size = Vector2(total_width_pixels, 0)
		parallax_node.repeat_times = 3
