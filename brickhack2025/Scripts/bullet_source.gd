extends Node2D

@onready var indicator = $BulletIndicator
@onready var timer = $Timer
@onready var start_timer = $StartTimer

@export var start_delay = 0.0
@export var indicator_delay = 1.0
@export var one_shot = false
@export var auto_start = true
@export var indicator_color : Color = Color.RED
@export var bullet_range = 400
@export var bullet_speed = 0.075

var bullet_scene = preload("res://Scenes/bullet.tscn")
var bullet

func _ready():
	indicator.set_color(indicator_color)
	indicator.set_range(bullet_range)
	timer.wait_time = indicator_delay
	start_timer.wait_time = start_delay
	if auto_start:
		start_timer.start()

func attack():
	bullet = bullet_scene.instantiate()
	add_child(bullet)
	indicator.turn_on()
	# start timer to fire the bullet
	timer.start()

func _on_bullet_bullet_finished() -> void:
	pass

func _on_timer_timeout() -> void:
	indicator.turn_off()
	bullet.fire()
	

func _on_start_timer_timeout() -> void:
	attack()
