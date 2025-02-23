extends Control

@onready var label = $CanvasLayer/Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label.visible = false

func _on_player_win() -> void:
	label.visible = true
