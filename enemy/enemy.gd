extends Node2D


signal died
signal end_turn

var battle_units: BattleUnits = preload("res://battle_units.tres")

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


func _ready() -> void:
	battle_units.enemy = self


func _exit_tree() -> void:
	battle_units.enemy = null


func attack() -> void:
	await _scene_tree.create_timer(0.4).timeout
	animation_player.play("attack")
	await animation_player.animation_finished
	end_turn.emit()


func deal_damage() -> void:
	battle_units.player_stats.hp -= 4


func take_damage(amount: int) -> void:
	hp -= amount
	if hp <= 0:
		died.emit()
		queue_free()
	else:
		animation_player.play("shake")
