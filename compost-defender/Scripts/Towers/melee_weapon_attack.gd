extends Node2D

signal attacked_enemy

@export var damage: int = 4
@export var seconds_between_attacks: float = 0.65
@export var hurt_box_scale: float = 1.0
@export var fire_stacks_effect: int = 0
var attack_cooldown: Timer
var attack_area: Area2D

func _ready() -> void:
	attack_area = $Hitbox
	attack_area.scale *= hurt_box_scale
	attack_cooldown = $AttackCooldown
	attack_cooldown.start(seconds_between_attacks)


func _process(_delta: float) -> void:
	if attack_cooldown.is_stopped():
		_on_attack_cooldown_timeout()


func _attack_enemy(enemy: Node2D) -> void:
	if not enemy.has_method("take_damage"):
		printerr("Enemy missing 'take_damage'")
		return
	enemy.take_damage(damage)
	attacked_enemy.emit()
	#print("Tower hit enemy")
	
	if fire_stacks_effect <= 0:
		return
	
	if not enemy.has_method("apply_fire_stacks"):
		printerr("Enemy missing 'apply_fire_stacks'")
		return
	enemy.apply_fire_stacks(fire_stacks_effect)


func _on_attack_cooldown_timeout() -> void:
	var areas_in_range: Array[Area2D] = attack_area.get_overlapping_areas()
	for area in areas_in_range:
		var entity: Node = area.get_parent()
		if _entity_is_enemy(entity):
			_attack_enemy(entity)
			attack_cooldown.start(seconds_between_attacks)
			return


func _entity_is_enemy(entity: Node) -> bool:
	if entity.is_in_group("Enemies"):
		return true
	return false
