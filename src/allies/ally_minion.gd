extends CharacterBody2D
class_name AllyMinion

const MOVEMENT_SPEED := 28.0

var attacking := false

var current_state : State

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	# TODO implement AStar and attack logic
	pass
