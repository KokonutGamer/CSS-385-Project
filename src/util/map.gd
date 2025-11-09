extends Resource

class_name Map

var array : Array[int]

@export var rows : int
@export var cols : int

func _init() -> void:
	array = Array()

func setValue(r: int, c: int, val: int) -> void:
	if(r < 0 || r >= rows || c < 0 || c >= cols):
		push_error("Position out-of-bounds:", r, c)
		return
	array[r * cols + c] = val

func getValue(r: int, c: int) -> int:
	if(r < 0 || r >= rows || c < 0 || c >= cols):
		push_error("Position out-of-bounds:", r, c)
		return 0
	return array[r * cols + c]
