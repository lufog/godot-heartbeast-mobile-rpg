extends Node


@onready var enemy: Node2D = $Enemy
@onready var action_buttons: GridContainer = $UI/ActionButtons


func _on_sword_button_pressed() -> void:
	if enemy != null:
		enemy.hp -= 4


func _on_enemy_died() -> void:
	enemy = null
	action_buttons.hide()
