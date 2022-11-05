extends Control


@export_multiline var description := ""

@onready var _root := get_tree().root


func _on_mouse_entered() -> void:
	var text_box: RichTextLabel = _root.find_child("TextBox", true, false)
	text_box.text = description


func _on_mouse_exited() -> void:
	var text_box: RichTextLabel = _root.find_child("TextBox", true, false)
	text_box.text = ""
