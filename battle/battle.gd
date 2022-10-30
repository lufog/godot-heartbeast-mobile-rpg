extends Node


@onready var hp_label: Label = $Enemy/HPLabel


func _on_sword_button_pressed() -> void:
	hp_label.text = str(hp_label.text.to_int() + 1)
