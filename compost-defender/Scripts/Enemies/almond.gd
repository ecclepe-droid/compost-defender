extends PathFollow2D
const enemy_level = 1
const SPEED = 100
const MAX_HEALTH = 40
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
	print("Almond died")
	Globals.compost += 30
	print("You gained 30 compost and now have " + str(Globals.compost) + " compost")
	queue_free()
