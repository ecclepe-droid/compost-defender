extends PathFollow2D

const SPEED = 999


func _ready() -> void:
	progress = 0


func _process(delta: float) -> void:
	progress += SPEED * delta
