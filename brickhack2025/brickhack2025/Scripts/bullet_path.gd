extends PathFollow2D

@export var speed = 0.075
signal path_finished


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if progress_ratio + delta * 10 * speed < 1:
		progress_ratio += delta * 10 * speed
	else:
		path_finished.emit()
		
		
func reset() -> void:
	progress_ratio = 0;
