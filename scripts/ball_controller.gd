extends CharacterBody2D

var speed := 400
@onready var player: CharacterBody2D = %Player

const CENTER := Vector2(600, 300)

func _ready() -> void:
	randomize()
	
	velocity = Vector2(randf_range(-1.0, 1.0), randf_range(-1.0, 1.0)).normalized() * speed

func _physics_process(_delta: float) -> void:
	#print(velocity)
	move_and_slide()

func _on_bounce_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("platform"):
		var target := Vector2(randf_range(550.0, 650.0), randf_range(250.0, 350.0))
		velocity = position.direction_to(target) * speed
	if body.is_in_group("player") and G.game_end == false:
		G.game_end = true
		G.game_over.emit()
		Engine.time_scale = 0.2
