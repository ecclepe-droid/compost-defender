extends Control

signal user_wants_worm(worm: PackedScene, position: Vector2i)

var path_of_last_selected_worm: String


func _on_gui_input(event: InputEvent) -> void:
	var any_worm_selected = $VBoxContainer/ItemList.is_anything_selected()
	if event.is_action("Select") and any_worm_selected:
		
		var index_of_selected_worm = $VBoxContainer/ItemList.get_selected_items()[0]
		var worm_name: String = $VBoxContainer/ItemList.get_item_text(index_of_selected_worm)
		var worm_file_path = "res://Scenes/Towers/" + worm_name.to_snake_case() + ".tscn"
		var packed_scene_of_worm = load(worm_file_path)
		
		var gloabl_mouse_position = get_local_mouse_position()
	
		user_wants_worm.emit(packed_scene_of_worm, gloabl_mouse_position)
