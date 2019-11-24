extends RigidBody2D

var speed = 1
var is_orbiting = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	handleOrbit()

func handleOrbit() -> void:
	if(is_orbiting):
		angular_velocity = -2 * speed
