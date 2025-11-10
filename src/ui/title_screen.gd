extends Control


func _ready() -> void:
	var cfg := ConfigFile.new()
	var err := cfg.load("user://controls.cfg")
	if err != OK:
		print("No config found, using defaults.")
		return
	
	# Clear old events for each action
	for action in ["move_up", "move_down", "move_left", "move_right"]:
		InputMap.action_erase_events(action)
		
		var key_code := int(cfg.get_value("controls", action, 0))
		if key_code != 0:
			var event := InputEventKey.new()
			event.physical_keycode = key_code as Key
			InputMap.action_add_event(action, event)
			
	print("Controls loaded!")

func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://src/levels/test_scene.tscn")

func _on_settings_button_pressed() -> void:
	get_tree().change_scene_to_file("res://src/ui/settings_menu.tscn")
