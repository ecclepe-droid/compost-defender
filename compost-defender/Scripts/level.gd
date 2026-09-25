extends Node2D

class_name Level

const LEVEL_SELECT_SCREEN = "res://Scenes/game_user_interface.tscn"

var user_interface: Control
@export var enemy_manager: EnemyManager
@export var level_ui: leveUI
@export var starting_compost: int

signal loss
signal victory

func get_waves() -> Array[Wave]:
	var waves: Array[Wave]
	
	var wave: Wave = Wave.new()
	wave.enemyScenes.push_back(_enemy_packed_from_name("apple"))
	waves.push_back(wave)
	
	return waves


func _ready() -> void:
	enemy_manager = $EnemyManager
	enemy_manager.enemy_died.connect(_on_enemy_spawner_enemy_died)
	enemy_manager.wave_ended.connect(_on_enemy_manager_wave_ended)
	enemy_manager.out_of_waves.connect(_on_enemy_manager_out_of_waves)
	enemy_manager.enemy_reached_end.connect(_on_enemy_manager_enemy_reached_end)
	level_ui.user_wants_worm_at_mouse.connect(_on_in_level_ui_user_wants_worm_at_mouse)
	Globals.health_multiplier = 0
	Globals.set_compost_amount(starting_compost)
	Globals.compost_integrity = starting_compost
	user_interface = $CanvasLayer/InLevelUI
	fade_out()
	if has_method("get_waves"):
		for wave in get_waves():
			enemy_manager.request_wave(wave)


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


func _on_enemy_manager_out_of_waves() -> void:
	print("You Won")
	if get_tree().current_scene != null:
		get_tree().current_scene.queue_free()
		get_tree().change_scene_to_file(LEVEL_SELECT_SCREEN)
		emit_signal("victory")


func _on_enemy_manager_enemy_reached_end(enemy_health: int) -> void:
	Globals.compost_integrity -= enemy_health
	print("Compost integrity:" + str(Globals.compost_integrity))
	if Globals.compost_integrity <= 0:
		print("You died")
		get_tree().current_scene.queue_free()
		get_tree().change_scene_to_file(LEVEL_SELECT_SCREEN)
		emit_signal("loss")


func _on_enemy_manager_wave_ended() -> void:
	pass
