extends Level


func get_waves() -> Array[Wave]:
	var waves: Array[Wave]
	
	var wave: Wave = Wave.new()
	wave.enemyScenes.push_back(_enemy_packed_from_name("leaf"))
	waves.push_back(wave)
	
	wave = Wave.new()
	wave.enemyScenes.push_back(_enemy_packed_from_name("pear"))
	wave.enemyScenes.push_back(_enemy_packed_from_name("pear"))
	wave.enemyScenes.push_back(_enemy_packed_from_name("pear"))
	wave.enemyScenes.push_back(_enemy_packed_from_name("pear"))
	wave.enemyScenes.push_back(_enemy_packed_from_name("pear"))
	wave.enemyScenes.push_back(_enemy_packed_from_name("orange"))
	waves.push_back(wave)
	
	wave = Wave.new()
	wave.enemyScenes.push_back(_enemy_packed_from_name("pear"))
	wave.enemyScenes.push_back(_enemy_packed_from_name("pear"))
	wave.enemyScenes.push_back(_enemy_packed_from_name("pear"))
	wave.enemyScenes.push_back(_enemy_packed_from_name("pear"))
	wave.enemyScenes.push_back(_enemy_packed_from_name("pomagranite"))
	wave.enemyScenes.push_back(_enemy_packed_from_name("banana"))
	waves.push_back(wave)
	
	wave = Wave.new()
	wave.enemyScenes.push_back(_enemy_packed_from_name("leaf"))
	wave.enemyScenes.push_back(_enemy_packed_from_name("leaf"))
	wave.enemyScenes.push_back(_enemy_packed_from_name("leaf"))
	wave.enemyScenes.push_back(_enemy_packed_from_name("leaf"))
	wave.enemyScenes.push_back(_enemy_packed_from_name("leaf"))
	wave.enemyScenes.push_back(_enemy_packed_from_name("leaf"))
	wave.enemyScenes.push_back(_enemy_packed_from_name("leaf"))
	wave.enemyScenes.push_back(_enemy_packed_from_name("cashew"))
	wave.enemyScenes.push_back(_enemy_packed_from_name("cashew"))
	wave.enemyScenes.push_back(_enemy_packed_from_name("orange"))
	waves.push_back(wave)
	
	return waves
