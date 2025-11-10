extends Node

@export var animation_tree : AnimationTree

@onready var minion = get_owner()

var last_facing_direction := Vector2(0, -1)

func _physics_process(_delta: float) -> void:
	var idle = !minion.velocity
	
	animation_tree.set("parameters/conditions/idle", idle)
	animation_tree.set("parameters/conditions/walk", !idle)
	
	if !idle:
		last_facing_direction = minion.velocity.normalized()
	
	animation_tree.set("parameters/Walk/blend_position", last_facing_direction)
	animation_tree.set("parameters/Idle/blend_position", last_facing_direction)
