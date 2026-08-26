extends PathFollow2D
class_name Fruits


func _ready() -> void:
	progress = 0


#class Fruits:
	#func damage(damageAmount: int) -> void:
	#health -= damageAmount
	#print(health)
	#if health <= 0:
		#_die()
#
#
	#func burn_tick():
	#if($BurnTimer.time_left == 0):
		#health -= fire
		#if(fire>0):
			#flaming = true
			#fire -= 1
			#print("I AM BURNING AND ONLY HAVE " + str(health) + " HEALTH LEFT")
		#else:
			#flaming = false
		#$BurnTimer.start()
		#if health <= 0:
			#_die()
