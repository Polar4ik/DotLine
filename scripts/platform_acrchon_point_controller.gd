extends Marker2D

@export var ball: CharacterBody2D

func _process(_delta: float) -> void:
	rotation = lerp_angle(rotation, ball.position.direction_to(position).angle(), 0.5)
