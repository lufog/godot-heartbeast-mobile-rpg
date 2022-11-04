extends "res://action_button/action_button.gd"


func _pressed() -> void:
	super()
	var player_stats = battle_units.player_stats
	if player_stats != null and player_stats.mp >= 8:
		player_stats.hp += 5
		player_stats.mp -= 8
		player_stats.ap -= 1
