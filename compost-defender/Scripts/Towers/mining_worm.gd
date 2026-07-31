extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	
	if $MiningWormAttackTimer.time_left <= 0.5:
		print("Swinging pickaxe!")
		$MiningWormAttackTimer.start(1.5)
		
		var aim_direction = global_position.direction_to(get_global_mouse_position())
		var aim_angle = rad_to_deg(aim_direction.angle())
		print(aim_angle)
