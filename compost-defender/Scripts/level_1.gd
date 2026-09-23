extends Level


func get_waves() -> Array[Wave]:
	var waves: Array[Wave]
	
	var wave: Wave = Wave.new()
	Globals.health_multiplier += .4
	wave.enemyScenes.push_back(_enemy_packed_from_name("leaf"))
	wave.enemyScenes.push_back(_enemy_packed_from_name("pear"))
	waves.push_back(wave)
	
	Globals.health_multiplier += .6
	wave = Wave.new()
	wave.enemyScenes.push_back(_enemy_packed_from_name("pear"))
	wave.enemyScenes.push_back(_enemy_packed_from_name("pear"))
	wave.enemyScenes.push_back(_enemy_packed_from_name("orange"))
	waves.push_back(wave)
	
	Globals.health_multiplyer += 1
	wave = Wave.new()
	wave.enemyScenes.push_back(_enemy_packed_from_name("pear"))
	wave.enemyScenes.push_back(_enemy_packed_from_name("pear"))
	wave.enemyScenes.push_back(_enemy_packed_from_name("orange"))
	wave.enemyScenes.push_back(_enemy_packed_from_name("orange"))
	wave.enemyScenes.push_back(_enemy_packed_from_name("pomagranite"))
	waves.push_back(wave)
	
	Globals.health_multiplyer += 1.5
	wave = Wave.new()
	wave.enemyScenes.push_back(_enemy_packed_from_name("pear"))
	wave.enemyScenes.push_back(_enemy_packed_from_name("pear"))
	wave.enemyScenes.push_back(_enemy_packed_from_name("orange"))
	wave.enemyScenes.push_back(_enemy_packed_from_name("orange"))
	wave.enemyScenes.push_back(_enemy_packed_from_name("pomagranite"))
	wave.enemyScenes.push_back(_enemy_packed_from_name("pomagranite"))
	wave.enemyScenes.push_back(_enemy_packed_from_name("banana"))
	waves.push_back(wave)
	
	return waves
