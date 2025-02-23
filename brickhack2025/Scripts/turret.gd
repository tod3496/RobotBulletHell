extends StaticBody2D

@onready var timer = $Timer

@export var fire_rate : float = 1
@export var bullet_lifetime : float = 1
@export var bullet_speed : float = 100

var bullet_indicator_scene = preload("res://Scenes/bullet_indicator.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.wait_time = fire_rate
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	pass # Replace with function body.
