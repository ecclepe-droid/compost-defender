extends Control


@export var menu_screen = HBoxContainer
@export var level_select_screen = MarginContainer
@export var controls_screen = MarginContainer

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
