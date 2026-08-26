extends StaticBody2D

func _ready() -> void:
	var attack = $FireAttack
	attack.damage = 0
	attack.fire = 5
	attack.cooldownSeconds = 0.70
	attack.set_scale(Vector2.ONE * 0.70)
	
