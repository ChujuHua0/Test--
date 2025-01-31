extends Node2D

var slot_num: Vector2i
var item: Node
var slotUnfiled = true
@onready var nameLabel = $name

func addItem(new_item):
	if slotUnfiled:
		slotUnfiled = false
		$slot.reparent(new_item)
	else:
		print("nuhnuh")
