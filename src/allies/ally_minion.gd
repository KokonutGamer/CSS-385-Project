extends CharacterBody2D
class_name AllyMinion

@onready var navigation_agent : NavigationAgent2D = $NavigationAgent2D
@onready var health_component : HealthComponent = $HealthComponent
@export var target : StaticBody2D

const MOVEMENT_SPEED := 28.0

var attacking := false

var current_state : State

func _ready() -> void:
	health_component.health_depleted.connect(queue_free)

func move_towards(move_target: Vector2, _delta: float) -> void:
	var dir := move_target - global_position
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
