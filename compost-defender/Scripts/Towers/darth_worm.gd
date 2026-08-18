extends StaticBody2D

func _ready() -> void:
	var attack = $MeleeAttack
	attack.damage = 100
	attack.cooldown_in_seconds = 2.5
	attack.set_scale(Vector2.ONE * 1.7)
	
