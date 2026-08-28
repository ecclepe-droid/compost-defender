extends PathFollow2D

signal died(compost_value: int)

const FIRE_FX = preload("res://Scenes/fire_fx.tscn")
const FIRE_DAMAGE_MULTIPLIER = 1
const SECONDS_BETWEEN_FIRE_STACKS = 1.0

@export var enemy_level: int = 1
@export var speed: float = 150.0
@export var max_health: int = 10
@export var compost_dropped: int = 10
@export var burn_timer: Timer
var fire_stacks
var health
var fire_fx: Sprite2D


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


func apply_fire_stacks(fire_stacks_to_apply: int) -> void:
	fire_stacks = max(0, fire_stacks_to_apply)
	if(fire_stacks >= 1):
		burn_timer.start(SECONDS_BETWEEN_FIRE_STACKS)
		fire_fx = FIRE_FX.instantiate()
		add_child(fire_fx)


func _consume_burn_stack() -> void:
	take_damage(fire_stacks * FIRE_DAMAGE_MULTIPLIER)
	fire_stacks -= 1
	print(health)
	
	if fire_stacks >= 1:
		burn_timer.start(SECONDS_BETWEEN_FIRE_STACKS)
	elif not fire_fx == null:
		fire_fx.queue_free()


func _die() -> void:
	died.emit(compost_dropped)
	queue_free()
