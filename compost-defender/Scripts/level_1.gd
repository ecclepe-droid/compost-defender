extends Node2D


func _ready() -> void:
	fade_out()
	

func fade_out():
	$AnimationPlayer.play("Fade_out")
	

func _on_worm_select_ui_worm_selected(worm: PackedScene) -> void:
	add_child(worm.instantiate())
