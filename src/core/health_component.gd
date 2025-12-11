class_name HealthComponent
extends Node

signal max_health_changed(diff: float)
signal health_changed(diff: float)
signal health_depleted

@export var max_health := 10.0 : set = set_max_health, get = get_max_health

@onready var health := max_health : set = set_health, get = get_health

func set_max_health(value: float) -> void:
	# TODO check logic in the future if this needs to have strict checks
	# i.e. max health limit, checks to restrict to only strict upgrades
	var diff = max_health - value
	max_health = value
	print("Set max health:", value)
	max_health_changed.emit(diff)
	
func get_max_health() -> float:
	print("Get max health:", max_health)
	return max_health

func set_health(value: float) -> void:
	var diff = health - value
	health = value
	print("Set health:", value)
	health_changed.emit(diff)
	
	# This entity has died :(
	if health <= 0:
		health_depleted.emit()

func get_health() -> float:
	print("Get health:", health)
	return health
