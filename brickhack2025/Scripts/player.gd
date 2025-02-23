class_name Player
extends CharacterBody2D

@onready var healthbar = $Healthbar
@export var animation_tree : AnimationTree

var health
var input_direction
var playback : AnimationNodeStateMachinePlayback

const SPEED = 150

func _ready():
	health = 10
	healthbar.init_health(health)
	playback = animation_tree["parameters/playback"]
	
func _set_health(value):
	
	health = value
	
	healthbar.health = health

func get_input(delta):
	input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * SPEED * delta * 100
	
func take_damage(amount):
	if (health - amount <= 0):
		_set_health(0)
	else:
		_set_health(health - amount)

func _physics_process(delta):
	# TEMP FOR TESTING DEALING DAMAGE
	if Input.is_action_just_pressed("ui_accept"):
		take_damage(1)
	
	get_input(delta)
	move_and_slide()
	select_animation()
	update_animation_parameters()
	
func update_animation_parameters():
	if input_direction == Vector2.ZERO:
		return
	animation_tree["parameters/Idle/blend_position"] = input_direction
	animation_tree["parameters/Walk/blend_position"] = input_direction
		
func select_animation():
	if velocity == Vector2.ZERO:
		playback.travel("Idle")
	else:
		playback.travel("Walk")
	


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("bullet"):
		take_damage(1)
