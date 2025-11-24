class_name Hitbox
extends Area2D

@export var damage: float = 0.0 : set = set_damage, get = get_damage

func set_damage(value: float) -> void:
	damage = value

func get_damage() -> float:
	return damage
