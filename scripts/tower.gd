extends StaticBody2D

@onready var main = get_tree().get_root().get_node("TestScene")
@onready var projectile = load("res://scenes/projectile.tscn")

@export var projectile_spawn_position: Vector2
@export var projectile_direction: float

func shoot() -> void:
	var instance = projectile.instantiate()
	instance.dir = projectile_direction
	instance.spawn_position = global_position + projectile_spawn_position
	instance.spawn_rotation = rotation
	main.add_child.call_deferred(instance)


func _on_cooldown_timeout() -> void:
	shoot()
