extends Node2D

var user_interface


func _ready() -> void:
	Globals.compost = 0
	user_interface = $CanvasLayer/InLevelUI
	user_interface.update_compost_amount(Globals.compost)
	fade_out()


func fade_out():
	$AnimationPlayer.play("Fade_out")


func _on_enemy_spawner_enemy_died(enemy_compost_value: Variant) -> void:
	Globals.compost += enemy_compost_value
	user_interface.update_compost_amount(Globals.compost)


func _on_in_level_ui_user_wants_worm(worm: PackedScene) -> void:
	if (Globals.compost < 50): # 50 is placeholder; we should make each worm's cost different
		return
	Globals.compost -= 50
	user_interface.update_compost_amount(Globals.compost)
	
	var worm_instance: StaticBody2D = worm.instantiate()
	worm_instance.position = get_global_mouse_position()
	add_child(worm_instance)
