extends Node2D

signal bullet_finished

@onready var area = $CharacterBody2D/Area2D
@onready var sprite = $CharacterBody2D/Sprite2D
@onready var charbody2d = $CharacterBody2D
@onready var timer = $Timer

@export var lifetime : float = 2
@export var speed : float = 100

var startpos

var moving = false

func _ready() -> void:
	timer.wait_time = lifetime
	area.monitorable = false
	sprite.visible = false
	moving = false
	startpos = charbody2d.position

func fire() -> void:
	timer.wait_time = lifetime
	area.monitorable = true
	sprite.visible = true
	moving = true
	timer.start()
	
func reset() -> void:
	area.monitorable = false
	sprite.visible = false
	moving = false
	charbody2d.position = startpos
	
func set_lifetime(new_lifetime):
	lifetime = new_lifetime
	
func set_speed(new_speed):
	speed = new_speed

func _process(delta):
	if moving:
		charbody2d.position += Vector2.RIGHT * speed * delta

func _on_timer_timeout() -> void:
	reset()
	bullet_finished.emit()
