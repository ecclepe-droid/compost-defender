class_name Worm

var name
var price
var scene
var icon

func _init(worm_name: String, worm_price: int, scene_path: String, icon_path: String) -> void:
	self.name = worm_name
	self.price = worm_price
	self.scene = load(scene_path)
	self.icon = load(icon_path)
