extends Control

signal user_wants_worm(worm: PackedScene)

var path_of_last_selected_worm: String
var anyworm_selected
var packed_scene_of_selected_worm


func _on_gui_input(event: InputEvent) -> void:
	if event.is_action_pressed("Select") and anyworm_selected:
		user_wants_worm.emit(packed_scene_of_selected_worm)


func _on_item_list_empty_clicked(_at_position: Vector2, _mouse_button_index: int) -> void:
	$VBoxContainer/ItemList.deselect_all()
	anyworm_selected = false


func _on_item_list_item_clicked(index: int, _at_position: Vector2, _mouse_button_index: int) -> void:
	var worm_name: String = $VBoxContainer/ItemList.get_item_text(index)
	var worm_file_path = "res://Scenes/Towers/" + worm_name.to_snake_case() + ".tscn"
	packed_scene_of_selected_worm = load(worm_file_path)
	
	anyworm_selected = true
