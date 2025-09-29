extends Node

@export var mob_scene: PackedScene
@export var music_tracks: Array[AudioStream]
var score: int

func _ready() -> void:
	$Music.set("stream", music_tracks.pick_random())

func game_over() -> void:
	$ScoreTimer.stop()
	$MobTimer.stop()
	$HeadsUpDisplay.show_game_over()
	$Music.stop()
	$DeathSound.play()
	
func new_game() -> void:
	score = 0
	$Player.start($StartPosition.position)
	$StartTimer.start()
	$HeadsUpDisplay.update_score(score)
	$HeadsUpDisplay.show_message("Get Ready")
	
	# Remove all mobs from the scren before starting new game
	get_tree().call_group("mobs", "queue_free")
	$Music.set("stream", music_tracks.pick_random())
	$Music.play()

func _on_mob_timer_timeout() -> void:
	# New instance of the mob
	var mob := mob_scene.instantiate()
	
	# Random location
	var mob_spawn_location := $MobPath/MobSpawnLocation
	
	# Set the progress on the path to a random number between 0 and 1
	mob_spawn_location.progress_ratio = randf()
	mob.position = mob_spawn_location.position
	
	# Randomize mob direction
	var direction = mob_spawn_location.rotation + PI / 2
	direction += randf_range(-PI / 4, PI / 4)
	mob.rotation = direction
	
	var velocity := Vector2(randf_range(150.0, 250.0), 0.0)
	mob.linear_velocity = velocity.rotated(direction)
	
	add_child(mob)

func _on_score_timer_timeout() -> void:
	score += 1
	$HeadsUpDisplay.update_score(score)

func _on_start_timer_timeout() -> void:
	$MobTimer.start()
	$ScoreTimer.start()
