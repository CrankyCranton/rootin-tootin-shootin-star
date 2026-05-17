class_name Interactable extends Area3D


@export var dialogue_title := ""


func interact() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	DialogueManager.show_dialogue_balloon(preload("uid://5t81i8ack4w7"), dialogue_title)
	await DialogueManager.dialogue_ended
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
