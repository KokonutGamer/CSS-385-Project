class_name AllyMinionState extends State

const IDLE = "idle"
const CHASING = "chasing"
const ATTACKING = "attacking"

var minion : AllyMinion

func _ready() -> void:
	await owner.ready
	minion = owner as AllyMinion
	assert(minion != null, "The AllyMinionState state type must be used only in the ally_minion scene. It needs the owner to be an AllyMinion node.")
