class_name Level extends Node3D


const LEAVE_DISTANCE := 150.0
const FADE_START_DISTANCE := 100.0

var game_ended := false

@onready var fps: Label = $FPS
@onready var clay: Clay = $Clay
@onready var fade: ColorRect = $Fade
@onready var ending_2_animation: VideoStreamPlayer = %Ending2Animation


func _ready() -> void:
	Music.switch("Nice Day")
	DialogueVars.game_ended.connect(_on_dialogue_vars_game_ended)


func _process(_delta: float) -> void:
	fade.color.a = (maxf(0.0, clay.position.length() - FADE_START_DISTANCE)
			/ (LEAVE_DISTANCE - FADE_START_DISTANCE))
	fps.text = str(Performance.get_monitor(Performance.TIME_FPS)) \
			+ "\n" + str(clay.global_transform)

	if clay.position.length() >= LEAVE_DISTANCE and not game_ended:
		game_ended = true
		ending_2_animation.play()
		await ending_2_animation.finished
		DialogueVars.end_game("Leaving Town", "Ending 2/1", Color.WHITE)


func _on_dialogue_vars_game_ended(title_text: String, subtitle_text: String, color: Color) -> void:
	game_ended = true
	clay.set_physics_process(false)
	clay.set_process_input(false)
	var end_screen: EndScreen = preload("uid://cuiqlonvx3y5w").instantiate()
	add_child(end_screen)
	end_screen.init(title_text, subtitle_text, color)
	await get_tree().process_frame
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
