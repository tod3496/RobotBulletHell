extends Node2D

signal bullet_source_finished

@onready var indicator = $BulletIndicator
@onready var bullet = $Bullet
@onready var timer = $Timer
@onready var start_timer = $StartTimer

@export var start_delay = 0.5
@export var indicator_delay = 0.5
@export var one_shot = false
@export var auto_start = true
@export var indicator_color : Color = Color.RED
@export var bullet_lifetime = 1
@export var bullet_speed = 500

func _ready():
	indicator.set_color(indicator_color)
	indicator.set_range(bullet_lifetime * bullet_speed)
	bullet.set_lifetime(bullet_lifetime)
	bullet.set_speed(bullet_speed)
	timer.wait_time = indicator_delay
	start_timer.wait_time = start_delay
	if auto_start:
		if start_delay == 0:
			attack()
		else:
			start_timer.start()

func attack():
	indicator.turn_on()
	# start timer to fire the bullet
	timer.start()

func set_indicator_delay(new_indicator_delay : float):
	indicator_delay = new_indicator_delay
	timer.wait_time = indicator_delay

func set_bullet_lifetime(new_bullet_lifetime : float):
	bullet_lifetime = new_bullet_lifetime
	bullet.set_lifetime(bullet_lifetime)
	indicator.set_range(bullet_lifetime * bullet_speed)

func set_bullet_speed(new_bullet_speed : float):
	bullet_speed = new_bullet_speed
	bullet.set_speed(bullet_speed)
	indicator.set_range(bullet_lifetime * bullet_speed)

func _on_timer_timeout() -> void:
	indicator.turn_off()
	bullet.fire()

func _on_start_timer_timeout() -> void:
	attack()

func _on_bullet_bullet_finished() -> void:
	bullet.reset()
	if not one_shot:
		attack()
	else:
		bullet_source_finished.emit()
