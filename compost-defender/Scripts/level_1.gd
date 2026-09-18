extends Level


func _ready() -> void:
	enemy_manager = $EnemyManager
	Globals.set_compost_amount(500)
	Globals.compost_integrity = 20
	user_interface = $CanvasLayer/InLevelUI
	fade_out()
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
