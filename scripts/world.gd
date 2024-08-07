#@tool
extends Node2D

var center := Vector2(600, 300)
@onready var player: CharacterBody2D = %Player

var energy := 60.0

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
	
	$Ability.energy_used.connect(
		func(new_energy: float):
			energy = new_energy * 6.0
	)
	
	G.game_over.connect(func():
			if %SaveManager.get_best_score() > %TimeLabel.time_pass:
				%SaveManager.save(%SaveManager.get_games_count() + 1, %SaveManager.get_best_score())
			else:
				%SaveManager.save(%SaveManager.get_games_count() + 1, %TimeLabel.time_pass)
			%EndGame.show()
			%TimeLabel.can_count = false
	)

func _input(_event: InputEvent) -> void:
	if G.game_end == false:
		return
	
	if Input.is_action_just_pressed("slow_down"):
		G.game_end = false
		get_tree().reload_current_scene()

func _process(_delta: float) -> void:
	queue_redraw()

func _draw() -> void:
	draw_circle(center, 60, Color.WEB_GRAY, false)
	draw_circle(center, 270, Color.WEB_GRAY, false)
	
	draw_circle(center, energy, Color(0.501961, 0.501961, 0.501961, 0.1))
