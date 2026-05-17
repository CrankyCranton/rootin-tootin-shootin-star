extends CanvasLayer


# An utter mess of code.
func _input(event: InputEvent) -> void:
	if event.is_action_pressed(&"ui_cancel") and not get_parent().game_ended:
		visible = not visible
		get_tree().paused = visible
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE if visible or get_parent().clay.talking \
				else Input.MOUSE_MODE_CAPTURED
