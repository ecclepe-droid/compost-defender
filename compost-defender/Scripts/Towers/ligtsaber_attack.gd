extends Node2D

signal attacked

var damage = 50.0
var cooldown_in_seconds = 2.5
var burn_cooldown_in_seconds = 0.1
var fire = 5

func _ready() -> void:
	$AttackCooldown.start(cooldown_in_seconds)
	$BurnCooldown.start(burn_cooldown_in_seconds)

func _physics_process(delta: float) -> void:
	var potential_enemy_areas: Array[Area2D] = $AttackArea.get_overlapping_areas()
	for potential_enemy_area in potential_enemy_areas:
		var potential_enemy: Node = potential_enemy_area.get_parent()
		
		if(potential_enemy.is_in_group("Enemies")):
			attack_enemy(potential_enemy)


func attack_enemy(enemy: Node2D) -> void:
	if(enemy.has_method("damage")):
		enemy.damage(damage)
		attacked.emit()
		#print_debug("Enemy attacked")
		
		$AttackCooldown.start(burn_cooldown_in_seconds)
		
		set_physics_process(false)
		$AttackCooldown.start(burn_cooldown_in_seconds)
