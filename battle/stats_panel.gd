extends Panel


@onready var hp_label: Label = $StatsContainer/HPLabel
@onready var ap_label: Label = $StatsContainer/APLabel
@onready var mp_label: Label = $StatsContainer/MPLabel


func _on_player_stats_hp_changed(value) -> void:
	hp_label.text = "HP\n" + str(value)


func _on_player_stats_ap_changed(value) -> void:
	ap_label.text = "AP\n" + str(value)


func _on_player_stats_mp_changed(value) -> void:
	mp_label.text = "MP\n" + str(value)
