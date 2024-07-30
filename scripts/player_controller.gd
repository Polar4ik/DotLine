@tool
extends CharacterBody2D

func _process(_delta: float) -> void:
	global_rotation = 0

#func _process(_delta: float) -> void:
	#var r_x := sin(deg_to_rad(-90)) * 60
	#var r_y := cos(deg_to_rad(0)) * 60
	#var new_pos: Vector2 = Vector2(r_x, r_y) + Vector2(600, 300) #+ Vector2(60, 0)
	#position = new_pos
