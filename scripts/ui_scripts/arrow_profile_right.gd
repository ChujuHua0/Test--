extends Button

func _on_pressed() -> void:
	$"..".id += 1
	print($"..".id)
