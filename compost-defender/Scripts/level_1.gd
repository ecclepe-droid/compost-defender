extends Level


func get_waves() -> Array[Wave]:
	var waves: Array[Wave]
	
	var wave: Wave = Wave.new()
	Globals.health_multiplier += .04
	wave.enemyScenes.push_back(_enemy_packed_from_name("leaf"))
	wave.enemyScenes.push_back(_enemy_packed_from_name("pear"))
	waves.push_back(wave)
	
	Globals.health_multiplier += .06
	wave = Wave.new()
	wave.enemyScenes.push_back(_enemy_packed_from_name("pear"))
	wave.enemyScenes.push_back(_enemy_packed_from_name("pear"))
	wave.enemyScenes.push_back(_enemy_packed_from_name("orange"))
	waves.push_back(wave)
	
	Globals.health_multiplier += 0.1
	wave = Wave.new()
	wave.enemyScenes.push_back(_enemy_packed_from_name("pear"))
	wave.enemyScenes.push_back(_enemy_packed_from_name("pear"))
	wave.enemyScenes.push_back(_enemy_packed_from_name("orange"))
	wave.enemyScenes.push_back(_enemy_packed_from_name("orange"))
	wave.enemyScenes.push_back(_enemy_packed_from_name("pomagranite"))
	waves.push_back(wave)
	
	Globals.health_multiplier += 0.15
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
