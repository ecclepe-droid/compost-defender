class_name Wave

extends Node

var enemyScenes: Array[PackedScene]
var secsAfterPreviousWave: float

func _init(enemyScenes: Array[PackedScene], secsAfterPrevoiusWave: float) -> void:
	self.enemyScenes = enemyScenes
	self.secsAfterPreviousWave = secsAfterPreviousWave
