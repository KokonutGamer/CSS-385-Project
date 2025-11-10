extends CharacterBody2D
class_name AllyMinion

@onready var navigation_agent : NavigationAgent2D = $NavigationAgent2D
@export var target : StaticBody2D

const MOVEMENT_SPEED := 28.0

var attacking := false

var current_state : State

# TODO remove this function
# Temporary solution for pathfinding
func _physics_process(delta: float) -> void:
	navigation_agent.target_position = target.global_position
	velocity = global_position.direction_to(navigation_agent.get_next_path_position()) * MOVEMENT_SPEED
	move_and_slide()

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
