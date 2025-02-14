extends Control

signal new_day

func _on_time_button_pressed() -> void:
	new_day.emit()
	
	
