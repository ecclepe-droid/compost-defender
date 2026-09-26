extends Node

var game_ui

signal loss
signal victory

func ready() -> void:
	loss.connect(game_ui.on_loss())
	victory.connect(game_ui.on_victory())
	pass
	
func connect_ui(in_game_ui):
	self.game_ui = in_game_ui
