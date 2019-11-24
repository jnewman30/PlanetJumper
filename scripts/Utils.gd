tool
extends Node

func load_sprite_folder(folder: String, ext: String) -> Array:
	var sprites = Array()
	var dir = Directory.new()
	
	if dir.dir_exists(folder) == false:
		return sprites
	
	dir.open(folder)
	dir.list_dir_begin(true)
	
	var file = dir.get_next()
	while file != "":
		if file.ends_with(ext):
			var path = dir.get_current_dir() + "/" + file
			if dir.file_exists(path):
				var sprite = load(path)
				sprites.append(sprite)
		file = dir.get_next()

	dir.list_dir_end()
	
	return sprites

func load_scene_node(scene_path) -> Node2D:
	var scene = load(scene_path)
	return scene.instance()

func get_random_pos_in_circle (center: Vector2, radius : float) -> Vector2:
	var x1 = rand_range (-1, 1)
	var x2 = rand_range (-1, 1)
	while x1*x1 + x2*x2 >= 1:
		x1 = rand_range (-1, 1)
		x2 = rand_range (-1, 1)
	
	var random_pos_on_unit_sphere = Vector2 (
		2 * x1 * sqrt (1 - x1*x1 - x2*x2),
		2 * x2 * sqrt (1 - x1*x1 - x2*x2))
		# 1 - 2 * (x1*x1 + x2*x2) # z for 3D
	
	var pos = random_pos_on_unit_sphere * rand_range (0, radius)
	pos += center
	return pos
