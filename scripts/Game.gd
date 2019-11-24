extends Node

const Utils = preload("res://scripts/Utils.gd")
onready var utils = Utils.new()

var rng = RandomNumberGenerator.new()

# StreamTexture[]
var planetSprites: Array

var level: int = 1
var viewSize: Vector2
var center: Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	setup_view()
	create_planets()
	create_ship()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func setup_view() -> void:
	viewSize = get_viewport().size
	center = Vector2(viewSize.x / 2, viewSize.y / 2)
	# print_debug("Center {x}, {y}".format({ "x": center.x, "y": center.y }))

func create_ship() -> void:
	var ship = utils.load_scene_node("res://scenes/subs/Ship.tscn")
	var startPlanet = get_node("Planet")
	# add_child(ship, true)
	startPlanet.capture_ship(ship)

func create_planets() -> void:
	planetSprites = utils.load_sprite_folder("res://sprites/planets", ".png")

	var count = level * 2
	var i = 0
	while i < count:
		var pos = utils.get_random_pos_in_circle(center, 400)
		create_planet(pos)
		i += 1

func create_planet(position) -> void:
	rng.randomize()
	var planet = utils.load_scene_node("res://scenes/subs/Planet.tscn")
	planet.position = position
	var sprite_index = rng.randi_range(0, planetSprites.size() -1)
	var texture = planetSprites[sprite_index]
	planet.set_texture(texture)
	add_child(planet, true)
