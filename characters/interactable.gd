class_name Interactable extends Area3D


@export var dialogue_title := ""


func interact() -> void:
	DialogueManager.show_dialogue_balloon(preload("uid://5t81i8ack4w7"), dialogue_title)
