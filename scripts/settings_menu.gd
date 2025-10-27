extends Control

var current_button : Button

# Buttons
@onready var move_up : Button = $MoveUp
@onready var move_down : Button = $MoveDown
@onready var move_left : Button = $MoveLeft
@onready var move_right : Button = $MoveRight

# Labels
@onready var move_up_label : Label = $MoveUpKey
@onready var move_down_label : Label = $MoveDownKey
@onready var move_left_label : Label = $MoveLeftKey
@onready var move_right_label : Label = $MoveRightKey

# Info
@onready var info_panel : PanelContainer = $InfoPanel

func _ready() -> void:
	# Connect the buttons pressed signal
	move_up.pressed.connect(_on_button_pressed.bind(move_up))
	move_down.pressed.connect(_on_button_pressed.bind(move_down))
	move_left.pressed.connect(_on_button_pressed.bind(move_left))
	move_right.pressed.connect(_on_button_pressed.bind(move_right))
	
	_update_labels()
	
	info_panel.hide() # hide the panel container on startup
	
func _on_button_pressed(button: Button) -> void:
	current_button = button
	info_panel.show()
	
func _input(event: InputEvent) -> void:
	if !current_button:
		return
	
	if event is InputEventKey || event is InputEventMouseButton:
		
		# Delete duplicate assignments
		# Add all assigned keys to a dictionary
		var all_keys : Dictionary = {}
		for action in InputMap.get_actions():
			for input_event in InputMap.action_get_events(action):
				all_keys[input_event.as_text()] = action
				
		# Check if the new key is already in the dictionary
		# Delete the old one if yes
		if all_keys.keys().has(event.as_text()):
			InputMap.action_erase_events(all_keys[event.as_text()])
		
		var event_name := _pascal_to_snake(current_button.name)
		# Erase the event in the input map
		InputMap.action_erase_events(event_name)
		
		# Assign the new event to it
		InputMap.action_add_event(event_name, event)
		
		# Set current_button back to null
		current_button = null
		info_panel.hide()
		
		_update_labels()
		
func _update_labels() -> void:
	var move_up_input_event : Array[InputEvent] = InputMap.action_get_events("move_up")
	if !move_up_input_event.is_empty():
		move_up_label.text = move_up_input_event[0].as_text()
	else:
		move_up_label.text = ""
	
	var move_down_input_event : Array[InputEvent] = InputMap.action_get_events("move_down")
	if !move_down_input_event.is_empty():
		move_down_label.text = move_down_input_event[0].as_text()
	else:
		move_down_label.text = ""
		
	var move_left_input_event : Array[InputEvent] = InputMap.action_get_events("move_left")
	if !move_left_input_event.is_empty():
		move_left_label.text = move_left_input_event[0].as_text()
	else:
		move_left_label.text = ""
		
	var move_right_input_event : Array[InputEvent] = InputMap.action_get_events("move_right")
	if !move_right_input_event.is_empty():
		move_right_label.text = move_right_input_event[0].as_text()
	else:
		move_right_label.text = ""

func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/title_screen.tscn")
	_save_controls()
	
func _save_controls() -> void:
	var cfg := ConfigFile.new()
	
	for action in ["move_up", "move_down", "move_left", "move_right"]:
		var events := InputMap.action_get_events(action)
		if !events.is_empty():
			var key_event := events[0] as InputEventKey
			cfg.set_value("controls", action, key_event.physical_keycode)

	cfg.save("user://controls.cfg")
	print("Controls saved!")

func _pascal_to_snake(text: String) -> String:
	var regex := RegEx.new()
	regex.compile("(?<!^)(?=[A-Z])")
	
	var snake = regex.sub(text, "_", true).to_lower()
	return snake
