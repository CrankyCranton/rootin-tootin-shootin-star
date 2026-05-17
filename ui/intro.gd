class_name Intro extends Control


@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


func _ready() -> void:
	DialogueVars.frame_requested.connect(_on_dialogue_vars_frame_requested)

	DialogueManager.show_dialogue_balloon(preload("uid://5t81i8ack4w7"), "intro")
	await DialogueManager.dialogue_ended
	get_tree().change_scene_to_file("res://level/level.tscn")


func _on_dialogue_vars_frame_requested(frame: int) -> void:
	animated_sprite_2d.frame = frame
	if frame == 1:
		await get_tree().create_timer(0.5, false).timeout
		if animated_sprite_2d.frame == 1:
			animated_sprite_2d.frame = 2
