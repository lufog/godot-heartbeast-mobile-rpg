extends Node2D


signal died

var hp := 25:
	get:
		return hp
	set(value):
		hp = value
		hp_label.text = str(hp) + "hp"
		if hp <= 0:
			died.emit()
			queue_free()
		else:
			animation_player.play("shake")
			await animation_player.animation_finished
			animation_player.play("attack")
			await animation_player.animation_finished
			var player_stats := get_parent().find_child("PlayerStats")
			player_stats.hp -= 3

@onready var hp_label: Label = $HPLabel
@onready var animation_player: AnimationPlayer = $AnimationPlayer