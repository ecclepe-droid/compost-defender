extends Node2D


func _ready() -> void:
	fade_out()
	

func fade_out():
	$AnimationPlayer.play("Fade_out")
	
