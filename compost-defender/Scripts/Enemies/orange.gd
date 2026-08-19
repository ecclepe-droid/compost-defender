extends PathFollow2D
var enemy_level = 3
const SPEED = 300
const MAX_HEALTH = 15
var health
var fire = 0
var flaming
func _ready() -> void:
	health = MAX_HEALTH
	progress = 0


func _process(delta: float) -> void:
	progress += SPEED * delta
	burn_tick()

#func damage(damageAmount: int) -> void:
#	health -= damageAmount
#	print(health)
#		_die()

func add_fire(burn):
	fire += burn
	print("my heat level is " + str(fire))

func burn_tick():
	if($BurnTimer.time_left == 0):
		health -= fire
		if(fire>0):
			flaming = true
			fire -= 1
			print("I AM BURNING AND ONLY HAVE " + str(health) + " HEALTH LEFT")
		else:
			flaming = false
		$BurnTimer.start()
		if health <= 0:
			_die()

func _die() -> void:
	print("Orange died")
	Globals.compost += 10
	print("You gained 10 compost and now have " + str(Globals.compost) + " compost")
	queue_free()
