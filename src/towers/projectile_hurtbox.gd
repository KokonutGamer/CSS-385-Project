extends Hurtbox

func _on_area_entered(area: Area2D) -> void:
	if not area is Hurtbox:
		return
	owner.queue_free()
