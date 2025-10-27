extends CharacterBody2D

const MOVEMENT_SPEED := 32.0
var health := 100

func _physics_process(_delta: float) -> void:
	var direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if direction != Vector2.ZERO:
		velocity = direction * MOVEMENT_SPEED
	else:
		velocity = Vector2.ZERO
	move_and_slide()


func _on_hurtbox_body_entered(body: Node) -> void:
	health = health - 1
	print("Player took damage!")
