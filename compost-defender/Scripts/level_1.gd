extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	fade_out()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func fade_out():
	$AnimationPlayer.play("Fade_out")
