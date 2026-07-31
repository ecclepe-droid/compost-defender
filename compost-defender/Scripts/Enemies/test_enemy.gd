extends PathFollow2D

const SPEED = 999
const MAX_HEALTH = 100
var health


func _ready() -> void:
	health = MAX_HEALTH
	progress = 0


func _process(delta: float) -> void:
	progress += SPEED * delta


func damage(damageAmount: int) -> void:
	health -= damageAmount
	if health <= 0:
		_die()


func _die() -> void:
	queue_free()
