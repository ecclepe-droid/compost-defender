extends Control

const STARTING_SCREEN_FILE = "res://Scenes/start_screen.tscn"
const LEVEL_ONE_PACKED = preload("res://Scenes/level_1.tscn")
const LEVEL_TWO_PACKED = ("res://Scenes/level_1.tscn")
const LEVEL_THREE_PACKED = ("res://Scenes/level_1.tscn")
const LEVEL_FOUR_PACKED = ("res://Scenes/level_1.tscn")
const LEVEL_FIVE_PACKED = ("res://Scenes/level_1.tscn")


func _on_start_screen_button_pressed() -> void:
	get_tree().change_scene_to_file(STARTING_SCREEN_FILE)


func _on_level_one_button_pressed() -> void:
	get_tree().change_scene_to_packed(LEVEL_ONE_PACKED)
	printerr("Level One is not finished yet")


func _on_level_two_button_pressed() -> void:
	printerr("Level Two is not finished yet")


func _on_level_three_button_pressed() -> void:
	printerr("Level Three is not finished yet")


func _on_level_four_button_pressed() -> void:
	printerr("Level Four is not finished yet")


func _on_level_five_button_pressed() -> void:
	printerr("Level Five is not finished yet")
