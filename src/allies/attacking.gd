extends AllyMinionState

func enter(previous_state_path: String, data := {}) -> void:
	minion.attacking = true
	print(owner.name + " is attacking")

# TODO implement attack logic
