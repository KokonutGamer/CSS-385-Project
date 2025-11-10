extends Area2D
class_name Hurtbox

signal received_damage(damage: float)

@export var health_component : HealthComponent

func _ready() -> void:
	#connect("area_entered", _on_area_entered)
	area_entered.connect(_on_area_entered)

func _on_area_entered(area: Area2D) -> void:
	if not area is Hitbox:
		return
	var hitbox = area as Hitbox
	if hitbox:
		health_component.health -= hitbox.damage
		print(owner.name + " is under attack!")
