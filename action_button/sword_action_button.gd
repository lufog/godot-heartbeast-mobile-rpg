extends "res://action_button/action_button.gd"


const slash_effect_scene: PackedScene = preload("res://effects/slash_effect.tscn")

@onready var current_scene := get_tree().current_scene


func _pressed() -> void:
	super()
	var enemy = battle_units.enemy
	var player_stats = battle_units.player_stats
	if enemy != null and player_stats != null:
		_create_slash_effect(enemy.global_position)
		player_stats.ap -= 1
		player_stats.mp += 2
		enemy.take_damage(4)


func _create_slash_effect(effect_position: Vector2) -> void:
	var slash_effect := slash_effect_scene.instantiate()
	current_scene.add_child(slash_effect)
	slash_effect.global_position = effect_position
