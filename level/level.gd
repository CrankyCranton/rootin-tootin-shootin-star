class_name Level extends Node3D


@onready var fps: Label = $FPS
@onready var clay: Clay = $Clay


func _process(_delta: float) -> void:
	fps.text = str(Performance.get_monitor(Performance.TIME_FPS)) \
			+ "\n" + str(clay.global_transform)
