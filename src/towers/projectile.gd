extends CharacterBody2D

@onready var hitbox : Hitbox = $Hitbox
@onready var hurtbox : Hurtbox = $Hurtbox
@export var SPEED = 96

var dir : float
var spawn_position : Vector2
var spawn_rotation : float
var target: Node2D = null

func _ready() -> void:
	global_position = spawn_position
	global_rotation = spawn_rotation
	hitbox.collision_layer = 1 << 2
	hitbox.collision_mask = 1 << 1 # detect ally hurtbox
	hurtbox.collision_layer = 1 << 3
	hurtbox.collision_mask = 1 << 1 # detect ally hurtbox (unique to this case)
	
	# find target
	target = find_closest_target()
	if target:
		look_at(target.global_position)

func find_closest_target() -> Node2D:
	var candidates = []
	for node in get_tree().get_nodes_in_group("allies"):
		if node.is_inside_tree():
			candidates.append(node)

	if candidates.is_empty():
		return null

	var closest = candidates[0]
	var min_distance = global_position.distance_to(closest.global_position)

	for node in candidates:
		var dist = global_position.distance_to(node.global_position)
		if dist < min_distance:
			closest = node
			min_distance = dist
	
	return closest

func _physics_process(_delta: float) -> void:
	if target and target.is_inside_tree():
		var dir_vector = (target.global_position - global_position).normalized()
		rotation = dir_vector.angle()
		velocity = dir_vector * SPEED
	else:
		target = find_closest_target()
	
	move_and_slide()
