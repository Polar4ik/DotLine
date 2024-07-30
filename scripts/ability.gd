extends Node
class_name Abillity

signal energy_used(count: float)

var energy := 10.0
var can_reload := false

func _input(_event: InputEvent) -> void:
	if G.game_end == true:
		return
	
	if Input.is_action_just_pressed("slow_down") and energy > 0.0:
		set_slow_down()
		can_reload = false
	
	if Input.is_action_just_released("slow_down"):
		set_normal()

func _process(_delta: float) -> void:
	if G.game_end == true:
		return
	
	if energy == 0.0:
		set_normal()
		if $Timer.is_stopped():
			$Timer.start()
	
	if energy == 10.0:
		can_reload = false
	
	if not is_slow_down() and energy < 10.0 and energy > 0.0:
		can_reload = true
	
	if not is_slow_down() and can_reload:
		energy += 0.1
		energy = clampf(energy, 0.0, 10.0)
		
		energy_used.emit(energy)

	if is_slow_down() and energy > 0.0:
		energy -= 0.1
		energy = clampf(energy, 0.0, 10.0)
		
		energy_used.emit(energy)
	
	

func set_slow_down() -> void:
	Engine.time_scale = 0.3

func set_normal() -> void:
	Engine.time_scale = 1.0

func is_slow_down() -> bool:
	return Engine.time_scale < 1.0

func _on_timer_timeout() -> void:
	can_reload = true
