extends AllyMinionState

func enter(previous_state_path: String, data := {}) -> void:
	minion.attacking = true
	var direction = minion.global_position.direction_to(\
	minion.target.global_position).normalized()
	minion.get_node("AnimationTree").set("parameters/Attack/blend_position", direction)
	
	print(owner.name + " is attacking")

# TODO implement attack logic
