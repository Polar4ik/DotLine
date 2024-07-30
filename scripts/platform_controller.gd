extends CharacterBody2D

#var center := Vector2(600, 300)
#var d := 0.0

#func _ready() -> void:
	#position = center - Vector2(250, 0)

#func _process(_delta: float) -> void:
	#rotation = global_position.direction_to(center).angle() + PI / 2
	
	#d += delta
	#
	#var nx = sin(d) * 250
	#var ny = cos(d) * 250
	#
	#velocity = Vector2(nx, ny)
	#
	#move_and_slide()
