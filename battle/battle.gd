extends Node


@onready var enemy: Node2D = $Enemy
@onready var player_stats: Node = $PlayerStats
@onready var battle_action_buttons: GridContainer = $UI/ActionButtons


func _ready() -> void:
	start_player_turn()


func start_enemy_turn() -> void:
	battle_action_buttons.hide()
	if enemy != null:
		enemy.attack(player_stats)
		await enemy.end_turn
	start_player_turn()

func start_player_turn() -> void:
	battle_action_buttons.show()
	player_stats.ap = player_stats.max_ap
	await player_stats.end_turn
	start_enemy_turn()


func _on_sword_button_pressed() -> void:
	if enemy != null:
		enemy.take_damage(4)
		player_stats.ap -= 1


func _on_enemy_died() -> void:
	enemy = null
	battle_action_buttons.hide()
