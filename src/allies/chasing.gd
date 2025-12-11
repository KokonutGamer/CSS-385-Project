extends AllyMinionState

func enter(_previous_state_path: String, _data := {}) -> void:
	minion.attacking = false

func physics_update(_delta: float) -> void:
	minion.navigation_agent.target_position = minion.target.global_position
	minion.velocity = minion.global_position.direction_to(\
	minion.navigation_agent.get_next_path_position()) * minion.MOVEMENT_SPEED
	minion.move_and_slide()
	
	if minion.navigation_agent.is_navigation_finished():
		finished.emit(ATTACKING)
