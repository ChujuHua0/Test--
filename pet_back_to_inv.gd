extends Button

#signal backToInv

@export var texture_hover = Texture2D
@export var texture_base = Texture2D
@export var texture_clicked = Texture2D


func _on_mouse_entered() -> void:
	self.icon = texture_hover

func _on_mouse_exited() -> void:
	self.icon = texture_base
