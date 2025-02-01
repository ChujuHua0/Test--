extends Control

@onready var create_pet: Node= load("res://scenes/pet_creator.tscn").instantiate()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_exit_pressed() -> void:
	get_tree().quit()



func _on_play_pressed() -> void:
	get_parent().add_child(create_pet)
	queue_free()
