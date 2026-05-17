extends Node


signal game_ended(title_text: String, subtitle_text: String, color: Color)
signal frame_requested(frame: int)

var talked_to_seb := false
var talked_to_clover := false
var talked_to_joyce1 := false
var talked_to_joyce2 := false
var talked_to_howard1 := false
var talked_to_howard2 := false
var talked_to_howard3 := false
var talked_to_howard4 := false
var talked_to_howard5 := false
var talked_to_apple := false
var applewhere := false
var applehow := false
var talked_to_sebastian := false
var Teddyhobby := false
var Harper := false


func end_game(title_text: String, subtitle_text: String, color: Color) -> void:
	game_ended.emit(title_text, subtitle_text, color)


func set_frame(frame: int) -> void:
	frame_requested.emit(frame)
