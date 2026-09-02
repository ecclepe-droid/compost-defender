extends Node2D

signal enemy_died(enemy_compost_value)
signal wave_ended()
signal out_of_waves()

const SECONDS_BETWEEN_WAVES = 2.5
const SECONDS_BETWEEN_ENEMIES = 0.5
const DEFAULT_CHILD_COUNT = 3

var future_waves: Array[Wave]
var in_between_wave_timer: Timer
var in_between_enemy_timer: Timer
var wave_active
var current_wave: Wave


func _ready() -> void:
	in_between_wave_timer = $InbetweenWaveTimer
	in_between_enemy_timer = $InBetweenEnemyTimer
	wave_active = false


func _enemy_died(enemy_compost_value: int) -> void:
	enemy_died.emit(enemy_compost_value)
	
	var number_of_enemies = get_children().size() - DEFAULT_CHILD_COUNT
	if number_of_enemies == 0:
		wave_ended.emit()
		
		var has_next_wave = future_waves.size() >= 1
		if has_next_wave:
			in_between_wave_timer.start(SECONDS_BETWEEN_WAVES)
		else:
			wave_active = false
			out_of_waves.emit()


func _spawn_enemy(enemyScene: PackedScene) -> void:
	var enemy = enemyScene.instantiate()
	add_child(enemy)
	enemy.add_to_group("Enemies")
	enemy.connect("died", _enemy_died)


func _spawn_wave(wave: Wave):
	current_wave = wave
	in_between_enemy_timer.start(SECONDS_BETWEEN_ENEMIES)


func request_wave(wave: Wave) -> void:
	if wave_active:
		future_waves.append(wave)
	else:
		_spawn_wave(wave)
		wave_active = true


func _on_inbetween_wave_timer_timeout() -> void:
	_spawn_wave(future_waves.pop_front())


func _on_in_between_enemy_timer_timeout() -> void:
	_spawn_enemy(current_wave.enemyScenes.pop_back())
	var has_next_enemy = current_wave.enemyScenes.size() >= 1
	if has_next_enemy:
		in_between_enemy_timer.start(SECONDS_BETWEEN_ENEMIES)
	
