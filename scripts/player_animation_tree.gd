extends Node2D

@export var animation_tree: AnimationTree

# TODO create a type Player
@onready var player = get_owner()

var last_facing_direction := Vector2(0, -1)

func _physics_process(delta: float) -> void:
	var idle = !player.velocity
	
	animation_tree.set("parameters/conditions/idle", idle)
	animation_tree.set("parameters/conditions/walk", !idle)
	
	if !idle:
		last_facing_direction = player.velocity.normalized()
	
	animation_tree.set("parameters/Walk/blend_position", last_facing_direction)
	animation_tree.set("parameters/Idle/blend_position", last_facing_direction)
