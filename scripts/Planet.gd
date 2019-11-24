extends StaticBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func set_texture(texture):
	var sprite = find_node("Sprite", true, true)
	sprite.texture = texture

func capture_ship(ship: RigidBody2D) -> void:
	ship.position = Vector2(150, 0)
	add_child(ship, true)
	
	var pinJoint = find_node("PinJoint2D")
	pinJoint.node_a = get_path()
	pinJoint.node_b = ship.get_path()
	ship.is_orbiting = true