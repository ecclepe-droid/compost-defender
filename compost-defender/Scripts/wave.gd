class_name Wave

var enemyScenes: Array

#Code written by CEB
#[packed_scene_of_enemy], 2.5
static func create(enemy_array, number):
	var new_scene = Wave.new()
	new_scene.enemyScenes = enemy_array
	#TODO: figure out what that number does
	return new_scene
	
	
