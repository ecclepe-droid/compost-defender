extends PathFollow2D

class_name Enemy

signal died(compost_value: int)
signal looped_end(enemy: Enemy)

const FIRE_FX = preload("res://Scenes/fire_fx.tscn")
const TEMP_POP_FX = preload("res://Scenes/temporary_pop_fx.tscn")
const FIRE_DAMAGE_MULTIPLIER = 1
const SECONDS_BETWEEN_FIRE_STACKS = 1.0
const SECONDS_BETWEEN_SLOW_STACKS = 1.0
const DEFAULT_SPEED_MULTIPLIER = 3.0

@export var enemy_level: int = 1
@export var speed: float = 150.0
@export var max_health: int = 10
@export var compost_dropped: int = 10
@export var burn_timer: Timer
@export var slow_timer: Timer
var actual_speed
var fire_stacks
var slowing
var health
var stun
var fire_fx: Sprite2D


func _ready() -> void:
	max_health *= Globals.health_multiplier
	scale *= max_health / 10.0
	actual_speed = speed * DEFAULT_SPEED_MULTIPLIER
	health = max_health
	fire_stacks = 0
	progress = 0
	stun = 0
	slowing = 1
	burn_timer.timeout.connect(_consume_burn_stack)

func _process(delta: float) -> void:
	if (stun>0):
		stun -= 1
	else:
		move(delta)
	


func take_damage(damage_amount: int) -> void:
	health -= damage_amount
	if health <= 0:
		_die()
	else:
		var temp_pop_fx_node = TEMP_POP_FX.instantiate()
		add_child(temp_pop_fx_node)


func be_knocked_back(knockback_stacks: int) -> void:
	progress -= knockback_stacks * speed * 0.033

func get_slowed(slow_stacks_effect):
	slowing += slow_stacks_effect

func get_stunned(stun_stacks_effect):
	stun += stun_stacks_effect

func apply_fire_stacks(apply_burn_stacks: int) -> void:
	fire_stacks = max(0, apply_burn_stacks)
	if fire_stacks >= 1:
		burn_timer.start(SECONDS_BETWEEN_FIRE_STACKS)
		var fire_fx_node = FIRE_FX.instantiate()
		add_child(fire_fx_node)

func remove_slow_stack():
	if slow_timer.time_left==0:
		slowing -= 1
	slow_timer.start(SECONDS_BETWEEN_SLOW_STACKS)

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
	
func move(delta):
	var pre_movement_progress = progress
	progress += actual_speed * delta / slowing
	if slowing >= 2:
		remove_slow_stack()
	if pre_movement_progress > progress:
		looped_end.emit(self)
