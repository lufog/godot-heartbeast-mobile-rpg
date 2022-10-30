extends Node


@onready var enemy: Node2D = $Enemy


func _on_sword_button_pressed() -> void:
	enemy.hp -= 4
