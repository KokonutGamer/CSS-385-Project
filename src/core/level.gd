extends Node2D

class_name Level

@export var ally_spawn: Vector2i
@export var enemy_spawn : Vector2i
@export var map : Map

@onready var player := $Player

func _ready() -> void:
	# Loads the player character onto the ally spawn location
	# player.translate(ally_spawn)
	
	# Checks if the map contains a valid path
	_check_path()
	
	# TODO load the map (path tiles and ground tiles)
	# Path tiles are used by the pathfinding algorithm to guide troops
	# Ground tiles are placed around path tiles
	
	# TODO load the towers
	# TDOD add tower placement validation
	# TODO add tower initialization logic
	
# TODO implement this function to check if a path exists
func _check_path() -> void:
	# TODO throw if the map reference is null
	# TODO throw if the map has no values
	# TODO throw if the spawn position is outside of the range of the map
	# TODO validate if there's a valid path between ally_spawn and enemy_spawn
	pass

# TODO implement this function to calculate the absolute position of a coordinate
func _calculate_absolute_position(_x: int, _y: int) -> Vector2:
	# TODO add bounds checking for coordinates
	# TODO add tile size scaling
	return Vector2.ZERO
