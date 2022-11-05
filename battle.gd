extends Node


@export var enemy_scenes: Array[PackedScene]

var battle_units: BattleUnits = preload("res://battle_units.tres")

@onready var enemy_marker: Marker2D = $EnemyMarker
@onready var next_room_button: Button = $UI/CenterContainer/NextRoomButton
@onready var battle_action_buttons: GridContainer = $UI/ActionButtons
@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _ready() -> void:
	create_new_enemy()
	start_player_turn()


func _on_next_room_button_pressed() -> void:
	next_room_button.hide()
	animation_player.play("fade")
	await animation_player.animation_finished
	var player_stats = battle_units.player_stats
	player_stats.ap = player_stats.max_ap
	battle_action_buttons.show()
	create_new_enemy()


func _on_enemy_died() -> void:
	next_room_button.show()
	battle_action_buttons.hide()


func create_new_enemy() -> void:
	var enemy_scene = enemy_scenes.pick_random()
	var enemy = enemy_scene.instantiate()
	enemy.died.connect(self._on_enemy_died)
	enemy_marker.add_child(enemy)


func start_enemy_turn() -> void:
	battle_action_buttons.hide()
	var enemy = battle_units.enemy
	if enemy != null:
		enemy.attack()
		await enemy.end_turn
	start_player_turn()


func start_player_turn() -> void:
	battle_action_buttons.show()
	var player_stats = battle_units.player_stats
	player_stats.ap = player_stats.max_ap
	await player_stats.end_turn
	start_enemy_turn()

