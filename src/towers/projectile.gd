extends CharacterBody2D

@onready var hitbox : Hitbox = $Hitbox
@onready var hurtbox : Hurtbox = $Hurtbox
@export var SPEED = 64

var dir : float
var spawn_position : Vector2
var spawn_rotation : float

func _ready() -> void:
	global_position = spawn_position
	global_rotation = spawn_rotation
	hitbox.collision_layer = 1 << 2
	hitbox.collision_mask = 1 << 1 # detect ally hurtbox
	hurtbox.collision_layer = 1 << 3
	hurtbox.collision_mask = 1 << 1 # detect ally hurtbox (unique to this case)
	
func _physics_process(_delta: float) -> void:
	velocity = Vector2(0, -SPEED).rotated(deg_to_rad(dir))
	move_and_slide()
