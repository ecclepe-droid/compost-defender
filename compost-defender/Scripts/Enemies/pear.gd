extends PathFollow2D
var enemy_level = 2
const SPEED = 275
const MAX_HEALTH = 10
var health
var enemyName = name

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
	print(name + " died")
	Globals.compost += 5
	print("You gained 5 compost and now have " + str(Globals.compost) + " compost")
	queue_free()
