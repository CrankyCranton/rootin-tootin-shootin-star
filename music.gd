extends AudioStreamPlayer


func switch(track: String) -> void:
	set(&"parameters/switch_to_clip", track)
