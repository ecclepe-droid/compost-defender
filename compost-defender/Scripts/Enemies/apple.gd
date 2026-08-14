extends PathFollow2D
var enemy_level = 2
const SPEED = 150
const MAX_HEALTH = 20
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
	print("Apple died")
	Globals.compost += 10
	print("You gained 10 compost and now have " + str(Globals.compost) + " compost")
	queue_free()
