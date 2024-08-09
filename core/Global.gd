extends Node

@warning_ignore("unused_signal")
signal game_over

var game_end := false

var full_screene = false

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("fullscren_togle"):
		full_screene = !full_screene
		if full_screene:
			get_window().mode = Window.MODE_FULLSCREEN
		elif full_screene == false:
			get_window().mode = Window.MODE_WINDOWED
