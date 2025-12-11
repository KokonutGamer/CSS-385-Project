extends Control

# TODO IMPORTANT - refactor this code later to put this logic in the level, NOT the HUD
@export var spawn_position : Vector2 = Vector2(-274.0, 78.0)
@export var target : StaticBody2D

@onready var minion = preload("res://src/allies/ally_minion.tscn")
@onready var main = get_tree().get_root().get_node("TestScene")
@onready var morale_gauge := $MoraleGauge

func _on_spawn_button_pressed() -> void:
	var minion_cost = 10.0
	if(morale_gauge.current_morale >= minion_cost):
		morale_gauge.current_morale -= minion_cost
		var instance = minion.instantiate()
		instance.global_position = spawn_position
		instance.target = target
		main.add_child.call_deferred(instance)
