extends PathFollow2D
var enemy_level = 3
const SPEED = 400
const MAX_HEALTH = 10
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
	print("Banana died")
	Globals.compost += 15
	print("You gained 15 compost and now have " + str(Globals.compost) + " compost")
	queue_free()
