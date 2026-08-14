extends StaticBody2D

func _ready() -> void:
	var attack = $FireAttack
	attack.damage = 85
	attack.cooldownSeconds = 0.85
	attack.set_scale(Vector2.ONE * 0.85)
	
