extends Node


var battle_units: BattleUnits = preload("res://battle_units.tres")

@onready var battle_action_buttons: GridContainer = $UI/ActionButtons


func _ready() -> void:
	start_player_turn()


func start_enemy_turn() -> void:
	battle_action_buttons.hide()
	var enemy = battle_units.enemy
	if enemy != null:
		enemy.attack()
		await enemy.end_turn
	start_player_turn()


func start_player_turn() -> void:
	battle_action_buttons.show()
	var player_stats = battle_units.player_stats
	player_stats.ap = player_stats.max_ap
	await player_stats.end_turn
	start_enemy_turn()


func _on_enemy_died() -> void:
	battle_action_buttons.hide()
