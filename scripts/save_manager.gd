extends Node
class_name SaveManager


func _ready() -> void:
	var ini := ConfigFile.new()
	if ini.load("res://save.ini") != OK:
		print_debug("INI DO NOT FOUND!!!")
		save(0, 0)
	
	ini.load("res://save.ini")


func save(games_count: int, best_score: float) -> void:
	var ini := ConfigFile.new()
	
	ini.set_value("save", "games_count", games_count)
	ini.set_value("save", "best_score", best_score)
	
	ini.save("res://save.ini")

func get_games_count() -> int:
	var ini := ConfigFile.new()
	ini.load("res://save.ini")

	return ini.get_value("save", "games_count")

func get_best_score() -> float:
	var ini := ConfigFile.new()
	ini.load("res://save.ini")

	return ini.get_value("save", "best_score")
