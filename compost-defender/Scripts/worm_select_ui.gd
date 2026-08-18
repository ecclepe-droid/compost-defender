extends Control

signal worm_selected(worm: PackedScene)


func _on_item_list_item_activated(index: int) -> void:
	var worm_name: String = $VBoxContainer/ItemList.get_item_text(index)
	var worm_file_path = "res://Scenes/Towers/" + worm_name.to_snake_case() + ".tscn"
	print(worm_file_path)
	var worm_packed_scene = load(worm_file_path)
	
	worm_selected.emit(worm_packed_scene)
	
