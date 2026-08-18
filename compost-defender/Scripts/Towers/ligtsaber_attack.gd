extends Node2D

signal attacked

var damage = 50.0
var cooldown_in_seconds = 2.5
var burn_cooldown_in_seconds = 0.1
var fire = 1

func _ready() -> void:
	$attackCooldown.start(cooldown_in_seconds)
	$burnCooldown.start(burn_cooldown_in_seconds)

func _physics_process(delta: float) -> void:
	var potential_enemy_areas: Array[Area2D] = $attackArea.get_overlapping_areas()
	for potential_enemy_area in potential_enemy_areas:
		var potential_enemy: Node = potential_enemy_area.get_parent()
		
		if(potential_enemy.is_in_group("Enemies")):
			attack_enemy(potential_enemy)
			burn_enemy(potential_enemy)
			return
		

func attack_enemy(enemy: Node2D) -> void:
	if(enemy.has_method("damage")):
		enemy.damage(damage)
		attacked.emit()
		#print_debug("Enemy attacked")
		
		$attackCooldown.start(burn_cooldown_in_seconds)
		
		set_physics_process(false)
		$attackCooldown.start(burn_cooldown_in_seconds)

func burn_enemy(enemy: Node2D) -> void:
	if(enemy.has_method("add_fire")):
		enemy.add_fire(fire)
		attacked.emit()
		print("I burnt the orange with fire!")
		#print_debug("Enemy attacked")
		
		$burnCooldown.start(burn_cooldown_in_seconds)
		
		set_physics_process(false)
		$burnCooldown.start(burn_cooldown_in_seconds)
	else:
		printerr("Enemy doesn't have burn() method")

func _on_attack_cooldown_timeout() -> void:
	set_physics_process(true)
