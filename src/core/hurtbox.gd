extends Area2D
class_name Hurtbox

signal received_damage(damage: float)

@export var health_component : HealthComponent

func _ready() -> void:
	connect("area_entered", _on_area_entered)

func _on_area_entered(hitbox: Hitbox) -> void:
	if hitbox:
		health_component.health -= hitbox.damage
