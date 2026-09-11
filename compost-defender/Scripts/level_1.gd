extends Node2D

const LEVEL_SELECT_SCREEN = "res://Scenes/level_select_screen.tscn"

var user_interface: Control
var enemy_manager: Node2D


func _ready() -> void:
	enemy_manager = $EnemyManager
	Globals.set_compost_amount(50)
	Globals.compost_integrity = 20
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
	enemy_manager.request_wave(Wave.create([packed_scene_of_enemy], 1))
	enemy_name = "apple"
	enemy_file_path = "res://Scenes/Enemies/" + enemy_name.to_snake_case() + ".tscn"
	packed_scene_of_enemy = load(enemy_file_path)
	enemy_manager.request_wave(Wave.create([packed_scene_of_enemy], 1))
	enemy_name = "banana"
	enemy_file_path = "res://Scenes/Enemies/" + enemy_name.to_snake_case() + ".tscn"
	packed_scene_of_enemy = load(enemy_file_path)
	enemy_manager.request_wave(Wave.create([packed_scene_of_enemy], 1))
	enemy_name = "cashew"
	enemy_file_path = "res://Scenes/Enemies/" + enemy_name.to_snake_case() + ".tscn"
	packed_scene_of_enemy = load(enemy_file_path)
	enemy_manager.request_wave(Wave.create([packed_scene_of_enemy], 1))
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


func _on_enemy_manager_out_of_waves() -> void:
	print("You Won")
	get_tree().change_scene_to_file(LEVEL_SELECT_SCREEN)


func _on_enemy_manager_enemy_reached_end(enemy_health: int) -> void:
	Globals.compost_integrity -= enemy_health
	print("Compost integrity:" + str(Globals.compost_integrity))
	if Globals.compost_integrity <= 0:
		print("You died")
		get_tree().change_scene_to_file(LEVEL_SELECT_SCREEN)


func _on_enemy_manager_wave_ended() -> void:
	pass
