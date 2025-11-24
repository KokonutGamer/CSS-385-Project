extends Node2D

@onready var fade: CanvasLayer = $Fade

func _ready() -> void:
	await fade.fade(0.0, 1.0).finished

func _on_base_health_depleted() -> void:
	get_tree().call_deferred("change_scene_to_file", "res://src/ui/victory_screen.tscn")
