extends Control

signal worm_selected(worm: PackedScene)


#func _ready() -> void:
	#var worms = DirAccess.get_files_at("res://Scripts/Towers/")
	#for worm in worms:
		#var worm_name = worm.get_file().trim_suffix(".gd")
		#
		#if worm_name.ends_with("worm"):
			#worm_name = worm_name.replace_char("_".unicode_at(0), " ".unicode_at(0)).capitalize()
			#var x = Texture2D.new()
			#x.take_over_path(worm_name.to_snake_case() + ".png")
			#$VBoxContainer/ItemList.add_item(worm_name, x)
	

func _on_item_list_item_activated(index: int) -> void:
	var name_of_selected_worm = $VBoxContainer/ItemList.get_item_text(index)
	var scene_path_of_selected_worm = "res://Scenes/Towers/" + name_of_selected_worm.to_snake_case() + ".tscn"
	var selected_worm_as_object = load(scene_path_of_selected_worm)
	worm_selected.emit(selected_worm_as_object)
