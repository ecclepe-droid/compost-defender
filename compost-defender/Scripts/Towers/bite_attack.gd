extends Node2D

signal attacked

var damage = 5.0
var cooldown_in_seconds = 1


func _ready() -> void:
	$attackCooldown.start(cooldown_in_seconds)
	

func _physics_process(delta: float) -> void:
	var potential_enemy_areas: Array[Area2D] = $attackArea.get_overlapping_areas()
	for potential_enemy_area in potential_enemy_areas:
		var potential_enemy: Node = potential_enemy_area.get_parent()
		
		if(potential_enemy.is_in_group("Enemies")):
			attack_enemy(potential_enemy)
			return
		

func attack_enemy(enemy: Node2D) -> void:
	if(enemy.has_method("damage")):
		enemy.damage(damage)
		attacked.emit()
		#print_debug("Enemy attacked")
		
		$attackCooldown.start(cooldown_in_seconds)
		
		set_physics_process(false)
		$attackCooldown.start(cooldown_in_seconds)
	else:
		printerr("Enemy doesn't have damage() method")
	

func _on_attack_cooldown_timeout() -> void:
	set_physics_process(true)
