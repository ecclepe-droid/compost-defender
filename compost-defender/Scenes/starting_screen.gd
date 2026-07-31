extends Control

const LEVEL_SELECT_SCREEN = preload("res://Scenes/level_select_screen.tscn")
const OPTIONS_SCREEN = preload("res://Scenes/options_screen.tscn")


func _ready() -> void:
	pass


func _process(delta: float) -> void:
	pass


func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_packed(LEVEL_SELECT_SCREEN)


func _on_exit_button_pressed() -> void:
	get_tree().free()


func _on_options_button_pressed() -> void:
	get_tree().change_scene_to_packed(OPTIONS_SCREEN)
