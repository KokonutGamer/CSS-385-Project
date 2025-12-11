extends ProgressBar

@onready var health_component = get_node("../HealthComponent")  # Adjust path as needed

func _ready() -> void:
	health_component.health_changed.connect(_on_health_component_health_changed)
	health_component.max_health_changed.connect(_on_health_component_max_health_changed)
	
	# Set initial values
	max_value = health_component.max_health
	value = health_component.health

func _on_health_component_health_changed(_diff: float) -> void:
	value = health_component.health
	print("Health changed")
	
func _on_health_component_max_health_changed(_diff: float) -> void:
	max_value = health_component.max_health
	print("Max value changed")
