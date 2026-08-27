extends Control

signal user_wants_worm(worm: PackedScene)

var path_of_last_selected_worm: String
var anyworm_selected
var packed_scene_of_selected_worm
var worm_list: ItemList
var compost_label: RichTextLabel


func _ready() -> void:
	worm_list = $HBoxContainer/WormList
	compost_label = $HBoxContainer/VBoxContainer/HBoxContainer/CompostLabel
	update_compost_amount(0)

func _on_gui_input(event: InputEvent) -> void:
	if event.is_action_pressed("Select") and anyworm_selected:
		user_wants_worm.emit(packed_scene_of_selected_worm)


func update_compost_amount(compost_amount: int) -> void:
	compost_label.text = str(compost_amount)


func _on_item_list_empty_clicked(_at_position: Vector2, _mouse_button_index: int) -> void:
	worm_list.deselect_all()
	anyworm_selected = false


func _on_item_list_item_clicked(index: int, _at_position: Vector2, _mouse_button_index: int) -> void:
	var worm_name: String = worm_list.get_item_text(index)
	var worm_file_path = "res://Scenes/Towers/" + worm_name.to_snake_case() + ".tscn"
	packed_scene_of_selected_worm = load(worm_file_path)
	
	anyworm_selected = true
