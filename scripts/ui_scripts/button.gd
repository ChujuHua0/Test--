extends Button

signal buttonPressed

func _on_pressed() -> void:
	get_tree().call_group("Inventory","meow")
	emit_signal("buttonPressed")
