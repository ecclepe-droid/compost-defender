extends Node2D


func _ready() -> void:
	fade_out()
	

func fade_out():
	$AnimationPlayer.play("Fade_out")
	

func _on_worm_select_ui_user_wants_worm(worm: PackedScene, position: Vector2i) -> void:
	print(position)
	var worm_instance: StaticBody2D = worm.instantiate()
	worm_instance.position = position
	print(worm_instance.position)
	add_child(worm_instance)
