extends Node2D

signal attacked_enemy

@export var damage: int = 10 # the ammount of damage melee attacks do every hit  |||  10 = 10 damage per hit, 1 = 1 damage per hit
@export var seconds_between_attacks: float = 1.5 # how fast the melee attack reloads  |||  1 = 1 attack per second, 0.1 = 10 attacks per second
@export var hurt_box_scale: float = 2.5 # how big the range of the melee attack is  |||  1 = 100 pixels, 0.01 = 1 pixel
@export var fire_stacks_effect: int = 0 # how many stacks of fire the melee attack inflicts  |||  10 = 10 stacks of fire, 1 = 1 stack of fire
var attack_cooldown: Timer
var attack_area: Area2D

func _ready() -> void: # applies the attack range from above to the melee attack and starts the attack cooldown timer
	attack_area = $Hitbox
	attack_area.scale *= hurt_box_scale
	attack_cooldown = $AttackCooldown
	attack_cooldown.start(seconds_between_attacks)


func _process(_delta: float) -> void:# when the attack cooldown stops it starts the _on_attack_cooldown_timeout function
	if attack_cooldown.is_stopped():
		_on_attack_cooldown_timeout()

# does damage to the enemy based on the damage variable
func _attack_enemy(enemy: Node2D) -> void: # damages the enemy, and applies fire stacks using the variables declared above in line 5 and line 8. 
	if not enemy.has_method("take_damage"):# When the enemy doesn't have the take_damage function, or the apply_fire_stacks function it prints an error declaring what happened.
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


func _on_attack_cooldown_timeout() -> void: # looks for enemies in it's range with the _entity_is_enemy function and attacks it using the _attack enemy function. Then it starts the attack cooldown again
	var areas_in_range: Array[Area2D] = attack_area.get_overlapping_areas()
	for area in areas_in_range:
		var entity: Node = area.get_parent()
		if _entity_is_enemy(entity):
			_attack_enemy(entity)
			attack_cooldown.start(seconds_between_attacks)
			return


func _entity_is_enemy(entity: Node) -> bool: # determines if an entity is an enemy or not
	if entity.is_in_group("Enemies"):
		return true
	return false
