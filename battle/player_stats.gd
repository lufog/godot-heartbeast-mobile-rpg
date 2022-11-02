extends Node


signal hp_changed(value: int)
signal ap_changed(value: int)
signal mp_changed(value: int)
signal end_turn

var max_hp := 25
var hp := max_hp:
	get:
		return hp
	set(value):
		hp = min(value, max_hp)
		hp_changed.emit(hp)

var max_ap := 3
var ap := max_ap:
	get:
		return ap
	set(value):
		ap = min(value, max_ap)
		ap_changed.emit(ap)

var max_mp := 10
var mp := max_mp:
	get:
		return mp
	set(value):
		mp = min(value, max_mp)
		mp_changed.emit(mp)
