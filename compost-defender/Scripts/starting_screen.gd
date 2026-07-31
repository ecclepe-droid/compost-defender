extends Control

const LEVEL_SELECT_SCREEN_PACKED = preload("res://Scenes/level_select_screen.tscn")
const OPTIONS_SCREEN_PACKED = preload("res://Scenes/options_screen.tscn")


func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_packed(LEVEL_SELECT_SCREEN_PACKED)


func _on_options_button_pressed() -> void:
	printerr("Options Screen is not finished yet")
	get_tree().change_scene_to_packed(OPTIONS_SCREEN_PACKED)


func _on_exit_button_pressed() -> void:
	get_tree().quit(0)
