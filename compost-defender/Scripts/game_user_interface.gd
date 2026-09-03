extends Control


@export var menu_screen = HBoxContainer
@export var level_select_screen = MarginContainer
@export var controls_screen = MarginContainer
const LEVEL_ONE_PACKED = preload("res://Scenes/level_1.tscn")
const LEVEL_TWO_PACKED = preload("res://Scenes/level_2.tscn")
#const LEVEL_THREE_PACKED = preload("res://Scenes/level_3.tscn")
#const LEVEL_FOUR_PACKED = preload("res://Scenes/level_4.tscn")
#const LEVEL_FIVE_PACKED = preload("res://Scenes/level_5.tscn")

func toggle_visibility(object):
	if object.visible:
		object.visible = false
	else:
		object.visible = true




func _on_quit_button_pressed() -> void:
	get_tree().quit(0)


func _on_toggle_controls_menu_button_pressed() -> void:
	toggle_visibility(controls_screen)
	toggle_visibility(menu_screen)


func _on_toggle_level_select_menu_button_pressed() -> void:
	toggle_visibility(level_select_screen)
	toggle_visibility(menu_screen)

func fade_in(): # this function fades the screen to black
	$AnimationPlayer.play("Fade_in")

func _on_level_1_button_pressed() -> void:
	fade_in()
	await $AnimationPlayer.animation_finished
	get_tree().change_scene_to_packed(LEVEL_ONE_PACKED)

func _on_level_2_button_pressed() -> void:
	get_tree().change_scene_to_packed(LEVEL_TWO_PACKED)

func _on_level_3_button_pressed() -> void:
#	get_tree().change_scene_to_packed(LEVEL_THREE_PACKED)
	pass

func _on_level_4_button_pressed() -> void:
#	get_tree().change_scene_to_packed(LEVEL_FOUR_PACKED)
	pass

func _on_level_5_button_pressed() -> void:
#	get_tree().change_scene_to_packed(LEVEL_FIVE_PACKED)
	pass
