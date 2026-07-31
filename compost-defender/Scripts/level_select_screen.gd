extends Control

const LEVEL_ONE = preload("res://Scenes/level_1.tscn")
const STARTING_SCREEN = preload("res://Scenes/starting_screen.tscn")


func _ready() -> void:
	pass


func _process(delta: float) -> void:
	pass


func _on_level_one_button_pressed() -> void:
	get_tree().change_scene_to_packed(LEVEL_ONE)


func _on_start_screen_button_pressed() -> void:
	get_tree().change_scene_to_packed(STARTING_SCREEN)
