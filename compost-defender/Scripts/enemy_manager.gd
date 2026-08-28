extends Node2D

signal enemy_died(enemy_compost_value)
signal wave_ended()

var future_waves: Array[Wave]
var in_between_wave_timer: Timer
var wave_active


func _ready() -> void:
	in_between_wave_timer = $InbetweenWaveTimer
	wave_active = false


func _enemy_died(enemy_compost_value: int) -> void:
	enemy_died.emit(enemy_compost_value)
	
	var number_of_enemies = get_children().size() - 2
	if number_of_enemies == 0:
		in_between_wave_timer.start(future_waves.get(0).secsAfterPreviousWave)
		wave_ended.emit()


func _spawn_enemy(enemyScene: PackedScene) -> void:
	var enemy = enemyScene.instantiate()
	add_child(enemy)
	enemy.add_to_group("Enemies")
	enemy.connect("died", _enemy_died)


func _spawn_wave(wave: Wave):
	for enemyScene in wave.enemyScenes:
		_spawn_enemy(enemyScene)
	wave.free()


func request_wave(wave: Wave) -> void:
	if wave_active:
		future_waves.append(wave)
	else:
		_spawn_wave(wave)
		wave_active = true


func _on_inbetween_wave_timer_timeout() -> void:
	_spawn_wave(future_waves.pop_front())
