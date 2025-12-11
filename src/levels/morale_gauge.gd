extends ProgressBar

@export var morale_per_second: float = 2.0
@export var max_morale: float = 100.0

var current_morale: float = 0.0

func _ready() -> void:
	max_value = max_morale

func _process(delta: float) -> void:
	current_morale += morale_per_second * delta
	current_morale = clamp(current_morale, 0, max_morale)
	value = current_morale
