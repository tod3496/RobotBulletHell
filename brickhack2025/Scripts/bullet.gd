extends Node2D

@onready var area = $CharacterBody2D/Area2D
@onready var sprite = $CharacterBody2D/Sprite2D
@onready var charbody2d = $CharacterBody2D
@onready var timer = $Timer

@export var lifetime : float = 2
@export var speed : float = 100

var moving = false

func _ready() -> void:
	timer.wait_time = lifetime
	area.monitorable = false
	sprite.visible = false
	moving = false

func fire() -> void:
	area.monitorable = true
	sprite.visible = true
	moving = true
	timer.start()

func _process(delta):
	if moving:
		charbody2d.position += Vector2.RIGHT * speed * delta

func _on_path_follow_2d_path_finished() -> void:
	pass

func _on_timer_timeout() -> void:
	print("bullet timer done!")
	free()
