extends CharacterBody2D

@export var SPEED = 64

var dir : float
var spawn_position : Vector2
var spawn_rotation : float

func _ready() -> void:
	global_position = spawn_position
	global_rotation = spawn_rotation
	
func _physics_process(_delta: float) -> void:
	velocity = Vector2(0, -SPEED).rotated(deg_to_rad(dir))
	move_and_slide()
