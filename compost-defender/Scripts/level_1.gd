extends Node2D

var user_interface: Control
var enemy_manager: Node2D


func _ready() -> void:
	enemy_manager = $EnemyManager
	Globals.compost = 0
	user_interface = $CanvasLayer/InLevelUI
	user_interface.update_compost_amount(Globals.compost)
	fade_out()
	
	var enemy_name: String = "almond"
	var enemy_file_path = "res://Scenes/Enemies/" + enemy_name.to_snake_case() + ".tscn"
	var packed_scene_of_enemy = load(enemy_file_path)
	enemy_manager.request_wave(Wave.new([packed_scene_of_enemy], 2.5))
	enemy_name = "apple"
	enemy_file_path = "res://Scenes/Enemies/" + enemy_name.to_snake_case() + ".tscn"
	packed_scene_of_enemy = load(enemy_file_path)
	enemy_manager.request_wave(Wave.new([packed_scene_of_enemy], 2.5))
	enemy_name = "banana"
	enemy_file_path = "res://Scenes/Enemies/" + enemy_name.to_snake_case() + ".tscn"
	packed_scene_of_enemy = load(enemy_file_path)
	enemy_manager.request_wave(Wave.new([packed_scene_of_enemy], 2.5))
	enemy_name = "cashew"
	enemy_file_path = "res://Scenes/Enemies/" + enemy_name.to_snake_case() + ".tscn"
	packed_scene_of_enemy = load(enemy_file_path)
	enemy_manager.request_wave(Wave.new([packed_scene_of_enemy], 2.5))


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
