extends StaticBody2D

func _ready() -> void:
	$DarthWormAttackTimer.start()


func _on_pickaxe_hitbox_area_entered(area: Area2D) -> void:
	if($DarthWormAttackTimer.time_left > 0):
		return
	
	
	var potential_enemyHurtbox = area
	if(potential_enemyHurtbox.is_in_group("Enemies")):
		if(potential_enemyHurtbox.has_method("damage")):
			potential_enemyHurtbox.damage()
			$DarthWormAttackTimer.start()
		print("Lightsaber swung!")
