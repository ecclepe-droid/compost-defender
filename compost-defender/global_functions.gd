extends Node


func damage(enemyName, damageAmount, health: int) -> void:
	health -= damageAmount
	print(health)
	if health <= 0:
		_die()
		

func _die() -> void:
	print("Pear died")
	Globals.compost += 5
	print("You gained 5 compost and now have " + str(Globals.compost) + " compost")
	queue_free()
