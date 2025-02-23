extends Node2D

@onready var line = $Line2D
@onready var timer = $Timer

var is_on = false
var is_flashing = false

func _ready():
	line.set("shader_paramater/origin", position);
	line.visible = false
	
func set_color(color : Color) -> void:
	line.default_color = color
	
func set_range(distance : int):
	line.clear_points()
	line.add_point(Vector2(0, 0))
	line.add_point(Vector2(distance, 0))

func turn_on():
	timer.start()
	line.visible = true
	is_on = true
	is_flashing = true

func turn_off():
	line.visible = false
	is_on = false
	is_flashing = false

func _on_timer_timeout() -> void:
	# while is_flashing, should toggle the color on and off
	# every time the timer timeouts
	if is_flashing:
		if is_on:
			# turn it off
			line.visible = false
			is_on = false
		else:
			# turn it on
			line.visible = true
			is_on = true
		timer.start()
