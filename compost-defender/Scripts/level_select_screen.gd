extends Control

const STARTING_SCREEN_FILE = "res://Scenes/start_screen.tscn"
const LEVEL_ONE_PACKED = preload("res://Scenes/level_1.tscn")
const LEVEL_TWO_PACKED = preload("res://Scenes/level_2.tscn")
#const LEVEL_THREE_PACKED = preload("res://Scenes/level_1.tscn")
#const LEVEL_FOUR_PACKED = preload("res://Scenes/level_1.tscn")
#const LEVEL_FIVE_PACKED = preload("res://Scenes/level_1.tscn")


func _on_start_screen_button_pressed() -> void: # when the back button gets pressed it goes back to the main menu.
	get_tree().change_scene_to_file(STARTING_SCREEN_FILE)

func _on_level_one_button_pressed() -> void: # when the level 1 button gets pressed it goes to the level 1 scene and plays a fade in animation
	fade_in()
	await $AnimationPlayer.animation_finished
	get_tree().change_scene_to_packed(LEVEL_ONE_PACKED)


func _on_level_two_button_pressed() -> void: # when the level 2 button gets pressed it goes to the level 1 scene and plays a fade in animation
	fade_in()
	await $AnimationPlayer.animation_finished
	get_tree().change_scene_to_packed(LEVEL_TWO_PACKED)


func _on_level_three_button_pressed() -> void: # when the level 3 button gets pressed it goes to the level 1 scene and plays a fade in animation
	fade_in()
	await $AnimationPlayer.animation_finished


func _on_level_four_button_pressed() -> void: # when the level 4 button gets pressed it goes to the level 1 scene and plays a fade in animation
	fade_in()
	await $AnimationPlayer.animation_finished


func _on_level_five_button_pressed() -> void: # when the level 5 button gets pressed it goes to the level 1 scene and plays a fade in animation
	fade_in()
	await $AnimationPlayer.animation_finished


func fade_in(): # this function fades the screen to black
	$AnimationPlayer.play("Fade_in")
