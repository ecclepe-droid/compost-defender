extends PathFollow2D
var enemy_level = 2
const SPEED = 250
const MAX_HEALTH = 5
var health


func _ready() -> void:
	health = MAX_HEALTH
	progress = 0


func _process(delta: float) -> void:
	progress += SPEED * delta


func damage(damageAmount: int) -> void:
	health -= damageAmount
	print(health)
	if health <= 0:
		_die()


func _die() -> void:
	print("Leaf died")
	Globals.compost += 5
	print("You gained 5 compost and now have " + str(Globals.compost) + " compost")
	queue_free()
