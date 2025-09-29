extends Control


func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_scene.tscn")
	pass


func _on_quit_button_pressed() -> void:
	get_tree().quit()
	pass
