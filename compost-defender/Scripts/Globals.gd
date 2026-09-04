extends Node

signal compost_amount_changed(compost_amount: int)

var _compost_amount = 0
var compost_integrity = 100
var score = 0
var enemy_count = 0
var grape_kills = 0
var apple_kills = 0
var pear_kills = 0
var banana_kills = 0
var bosses_defeated = 0
var total_enimies_killed = 0
var miner_worms = 0
var kung_worms = 0

var acid_worms = 0
var total_worms = 0


func set_compost_amount(amount: int) -> void:
	_compost_amount = amount
	compost_amount_changed.emit(_compost_amount)


func change_compost_amount(change_amount: int) -> void:
	set_compost_amount(compost_amount() + change_amount)


func compost_amount_is(expression: Callable) -> bool:
	return expression.call(_compost_amount)


func compost_amount() -> int:
	return _compost_amount
