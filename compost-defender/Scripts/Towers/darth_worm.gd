extends StaticBody2D

func _ready() -> void:
	var attack = $LightsaberAttack
	attack.damage = 100
	attack.cooldownInSeconds = 2.5
	attack.set_scale(Vector2.ONE * 1.7)
	
