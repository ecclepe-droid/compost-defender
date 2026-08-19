extends Node
var heath = 4

func damage(enemy, damageAmount) -> void:
	enemy.health -= damageAmount
	print(enemy.health)
	if enemy.health <= 0:
		enemy.die()
		

func _die() -> void:
	print("pear died")
	Globals.compost += 5
	print("You gained 5 compost and now have " + str(Globals.compost) + " compost")
	queue_free()
