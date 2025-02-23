extends StaticBody2D

@onready var timer = $Timer
@onready var bullet_source = $BulletSource

@export var bullet_lifetime : float = 1
@export var bullet_speed : float = 100
@export var first_shot_delay : float = 0
@export var shot_gap_time: float = 0.5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	bullet_source.set_indicator_delay(0.5)
	bullet_source.set_bullet_lifetime(bullet_lifetime)
	bullet_source.set_bullet_speed(bullet_speed)
	
	if first_shot_delay == 0:
		turret_loop()
	else:
		timer.wait_time = first_shot_delay
		timer.start()

func turret_loop():
	bullet_source.attack()

func _on_bullet_source_bullet_source_finished() -> void:
	if shot_gap_time == 0:
		turret_loop()
	else:
		timer.wait_time = shot_gap_time
		timer.start()

func _on_timer_timeout() -> void:
	turret_loop()
