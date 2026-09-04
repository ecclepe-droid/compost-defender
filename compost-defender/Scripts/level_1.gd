extends Node2D

var user_interface: Control
var enemy_manager: Node2D


func _ready() -> void:
	enemy_manager = $EnemyManager
	Globals.set_compost_amount(0)
	user_interface = $CanvasLayer/InLevelUI
	fade_out()
	
	var wave1: Wave = Wave.new()
	wave1.enemyScenes.push_back(_enemy_packed_from_name("apple"))
	wave1.enemyScenes.push_back(_enemy_packed_from_name("almond"))
	wave1.enemyScenes.push_back(_enemy_packed_from_name("almond"))
	enemy_manager.request_wave(wave1)
	var wave2: Wave = Wave.new()
	wave2.enemyScenes.push_back(_enemy_packed_from_name("banana"))
	wave2.enemyScenes.push_back(_enemy_packed_from_name("banana"))
	wave2.enemyScenes.push_back(_enemy_packed_from_name("orange"))
	enemy_manager.request_wave(wave2)
	var wave3: Wave = Wave.new()
	wave3.enemyScenes.push_back(_enemy_packed_from_name("pomagranite"))
	wave3.enemyScenes.push_back(_enemy_packed_from_name("leaf"))
	wave3.enemyScenes.push_back(_enemy_packed_from_name("cashew"))
	enemy_manager.request_wave(wave3)


func _enemy_packed_from_name(enemy_name: String):
	var enemy_file_path = "res://Scenes/Enemies/" + enemy_name.to_snake_case() + ".tscn"
	var packed_scene_of_enemy = load(enemy_file_path)
	return packed_scene_of_enemy


func fade_out():
	$AnimationPlayer.play("Fade_out")


func _on_enemy_spawner_enemy_died(enemy_compost_value: Variant) -> void:
	Globals.change_compost_amount(enemy_compost_value)


func _on_in_level_ui_user_wants_worm_at_mouse(worm: Worm) -> void:
	if Globals.compost_amount() < worm.price:
		return
	Globals.change_compost_amount(-worm.price)
	
	var worm_instance: StaticBody2D = worm.scene.instantiate()
	worm_instance.position = get_global_mouse_position()
	add_child(worm_instance)
