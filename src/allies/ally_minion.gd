extends CharacterBody2D
class_name AllyMinion

@onready var navigation_agent : NavigationAgent2D = $NavigationAgent2D
@export var target : StaticBody2D

const MOVEMENT_SPEED := 28.0

var attacking := false

var current_state : State

func move_towards(target: Vector2, delta: float) -> void:
	var dir := target - global_position
	if dir.length() > 0.01:
		velocity = dir.normalized() * MOVEMENT_SPEED
	else:
		velocity = Vector2.ZERO
	move_and_slide()

func start_attack() -> void:
	attacking = true
	# TODO play attack animation and spawn hitbox

func stop_attack() -> void:
	attacking = false
	# TODO stop attack animation and cleanup
