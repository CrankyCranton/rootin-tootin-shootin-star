class_name EndScreen extends Control


@onready var background: ColorRect = $Background
@onready var title: Label = $Title
@onready var subtitle: Label = $Subtitle


func init(title_text: String, subtitle_text: String, color: Color) -> void:
	title.text = title_text
	subtitle.text = subtitle_text
	background.color = color


func _on_quit_button_pressed() -> void:
	get_tree().quit()
