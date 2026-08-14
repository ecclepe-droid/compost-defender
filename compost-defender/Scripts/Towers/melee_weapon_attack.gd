extends Node2D

signal attacked

var damage = 50.0
var cooldownInSeconds = 2.5


func _ready() -> void:
	$attackCooldown.start(cooldownInSeconds)
	

func _physics_process(delta: float) -> void:
	var potentialEnemyAreas: Array[Area2D] = $attackArea.get_overlapping_areas()
	for potentialEnemyArea in potentialEnemyAreas:
		var potentialEnemy: Node = potentialEnemyArea.get_parent()
		
		if(potentialEnemy.is_in_group("Enemies")):
			attack_enemy(potentialEnemy)
			return
		

func attack_enemy(enemy: Node2D) -> void:
	if(enemy.has_method("damage")):
		enemy.damage(damage)
		attacked.emit()
		#print_debug("Enemy attacked")
		
		$attackCooldown.start(cooldownInSeconds)
		
		set_physics_process(false)
		$attackCooldown.start(cooldownInSeconds)
	else:
		printerr("Enemy doesn't have damage() method")
	

func _on_attack_cooldown_timeout() -> void:
	set_physics_process(true)
