extends Node

signal enemy_died(enemy_compost_value)

var path: Path2D


func _ready() -> void:
	path = $EnemyPath
	var enemies = path.get_children()
	for enemy: Node2D in enemies:
		enemy.connect("died", _enemy_died)


func _enemy_died(enemy_compost_value: int) -> void:
	enemy_died.emit(enemy_compost_value)
