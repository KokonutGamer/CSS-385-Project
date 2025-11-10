class_name State extends Node

signal finished(next_state_path: String, data: Dictionary)

func handle_input(_event: InputEvent) -> void:
	pass

# Called by the state machine on the engine's main loop
func update(_delta: float) -> void:
	pass

# Called by the state machine on the engine's physic loop
func physics_update(_delta: float) -> void:
	pass

# Called upon the state machine changing the active state
# Data can be used to initialize itself
func enter(previous_state_path: String, data := {}) -> void:
	pass

# Called upon the state machine leaving this state
# Used to clean up the state before exiting
func exit() -> void:
	pass
