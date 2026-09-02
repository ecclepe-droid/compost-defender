class_name Worm

var name
var price
var scene
var icon

func _init(name: String, price: int, scene_path: String, icon_path: String) -> void:
	name = name
	price = price
	scene = load(scene_path)
	icon = load(icon_path)
