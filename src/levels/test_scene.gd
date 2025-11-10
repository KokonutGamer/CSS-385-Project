extends Node2D

func _on_base_health_depleted() -> void:
	get_tree().call_deferred("change_scene_to_file", "res://src/ui/title_screen.tscn")
