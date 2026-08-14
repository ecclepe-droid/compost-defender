extends Node2D

var damage
var cooldownInSeconds


func _ready() -> void:
	damage = 80.0
	cooldownInSeconds = 3.0
	

func _on_attack_area_area_entered(area: Area2D) -> void:
	if($attackCooldown.time_left > 0):
		return
	var potentialEnemy = area.get_parent()
	if(potentialEnemy.is_in_group("Enemies")):
		if(potentialEnemy.has_method("damage")):
			potentialEnemy.damage(damage)
			print_debug("Enemy attacked")
			
			$attackCooldown.start(cooldownInSeconds)
	
