extends PathFollow2D

const FIRE_DAMAGE_MULTIPLIER = 1
const SECONDS_BETWEEN_FIRE_STACKS = 1.0

@export var enemy_level: int = 1
@export var speed: float = 150.0
@export var max_health: int = 10
@export var compost_dropped: int = 10
@export var burn_timer: Timer
var fire_stacks
var health


func _ready() -> void:
	health = max_health
	fire_stacks = 0
	progress = 0
	burn_timer.timeout.connect(_consume_burn_stack)

func _process(delta: float) -> void:
	progress += speed * delta


func take_damage(damage_amount: int) -> void:
	health -= damage_amount
	if health <= 0:
		_die()


func apply_fire_stacks(burn_stacks_to_apply: int) -> void:
	fire_stacks = burn_stacks_to_apply


func _consume_burn_stack() -> void:
	take_damage(fire_stacks * FIRE_DAMAGE_MULTIPLIER)
	fire_stacks -= 1
	
	if(fire_stacks >= 1):
		burn_timer.start(SECONDS_BETWEEN_FIRE_STACKS)


func _die() -> void:
	Globals.compost += compost_dropped
	queue_free()
