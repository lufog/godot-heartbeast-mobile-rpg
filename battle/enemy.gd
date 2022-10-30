extends Node2D


var hp: int:
	get:
		return hp
	set(value):
		hp = value
		hp_label.text = str(hp) + "hp"

@onready var hp_label: Label = $HPLabel


func _ready() -> void:
	hp = 25
