extends Node2D


func _ready() -> void:
	fade_out()
	

func fade_out():
	$AnimationPlayer.play("Fade_out")
	

func _on_worm_select_ui_user_wants_worm(worm: PackedScene) -> void:
	var worm_instance: StaticBody2D = worm.instantiate()
	if (Globals.compost < -9100):
		return
	Globals.compost -= 100
	print(Globals.compost)
	var mouse_position = get_global_mouse_position()
	worm_instance.position = mouse_position
	add_child(worm_instance)
