extends "res://action_button/action_button.gd"


func _pressed() -> void:
	super()
	var player_stats := current_scene.find_child("PlayerStats")
	if player_stats != null and player_stats.mp >= 8:
		player_stats.hp += 5
		player_stats.mp -= 8
		player_stats.ap -= 1
