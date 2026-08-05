extends StaticBody2D

func _ready() -> void:
	$MiningWormAttackTimer.start()


func _on_pickaxe_hitbox_area_entered(area: Area2D) -> void:
	if($MiningWormAttackTimer.time_left > 0):
		return
	
	var potentialEnemyHurtbox = area
	if(potentialEnemyHurtbox.is_in_group("Enemies")):
		if(potentialEnemyHurtbox.has_method("damage")):
			potentialEnemyHurtbox.damage()
			$MiningWormAttackTimer.start()
		print("Pickaxe swung!")
