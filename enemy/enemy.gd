extends Node2D


signal died
signal end_turn

var current_target = null
var hp := 25:
	get:
		return hp
	set(value):
		hp = value
		hp_label.text = str(hp) + "hp"

@onready var hp_label: Label = $HPLabel
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var _scene_tree := get_tree()


func attack(target) -> void:
	await _scene_tree.create_timer(0.4).timeout
	current_target = target
	animation_player.play("attack")
	await animation_player.animation_finished
	current_target = null
	end_turn.emit()


func deal_damage() -> void:
	if current_target != null:
		current_target.hp -= 4


func take_damage(amount: int) -> void:
	hp -= amount
	if hp <= 0:
		died.emit()
		queue_free()
	else:
		animation_player.play("shake")
