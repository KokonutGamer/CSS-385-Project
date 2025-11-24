extends CanvasLayer

@export var init_alpha: float = 0.0

@onready var black_out: ColorRect = $BlackOut

func _ready() -> void:
	black_out.color.a = init_alpha

func fade(target_alpha: float, duration: float = 1.0) -> Tween:
	var tween = create_tween()
	tween.tween_property(black_out, "color:a", target_alpha, duration)
	return tween
