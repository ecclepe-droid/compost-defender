extends Control

signal user_wants_worm_at_mouse(worm: Worm, where: Vector2i)

var anyworm_selected: bool
var last_selected_worm: Worm
var worm_list: ItemList
var compost_label: RichTextLabel
var worms: Array[Worm]


func _ready() -> void:
	worms.push_back(Worm.new("Fire Worm", 25, "res://Scenes/Towers/fire_worm.tscn", "res://Sprites/Towers/fire(13).png"))
	worms.push_back(Worm.new("Darth Worm", 25, "res://Scenes/Towers/darth_worm.tscn", "res://Sprites/Towers/download (7).png"))
	
	worm_list = $HBoxContainer/WormList
	for worm in worms:
		var item_index = worm_list.add_item(worm.name + "\n$" + str(worm.price), worm.icon)
		worm_list.set_item_metadata(item_index, worm)
	compost_label = $HBoxContainer/VBoxContainer/HBoxContainer/CompostLabel
	
	Globals.compost_amount_changed.connect(update_compost_amount)
	update_compost_amount(Globals.compost_amount())


func _on_gui_input(event: InputEvent) -> void: # selects the towers when you click on them
	if event.is_action_pressed("Select") and anyworm_selected:
		user_wants_worm_at_mouse.emit(last_selected_worm)


func update_compost_amount(compost_amount: int) -> void: # updates compost ammont
	compost_label.text = str(compost_amount)


func _on_item_list_empty_clicked(_at_position: Vector2, _mouse_button_index: int) -> void: # deselects the towers when you click on an empty space in the ui
	worm_list.deselect_all()
	anyworm_selected = false


func _on_item_list_item_clicked(index: int, _at_position: Vector2, _mouse_button_index: int) -> void: # places the selected tower at the location of the mouse if you have enough compost
	last_selected_worm = worm_list.get_item_metadata(index)
	anyworm_selected = true
