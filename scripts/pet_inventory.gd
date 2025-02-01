extends Control

signal slotClicked(slot)
signal toProfile(id)

@onready var slots: Array= [$"1",$"2",$"3",$"4",$"5",$"6",$"7",$"8"]
@onready var packedProfile: Node= preload("res://scenes/pet_profile_scn.tscn").instantiate()

func _ready() -> void:
	self.updateInventory()
	
func updateInventory():
	if GlobalData.getInventorySize() <= 8:
		for i in GlobalData.getInventorySize():
			slots[i].update(GlobalData.getPetInventoryAtIndex(i))
	else:
		print("nuh huh")	

func changeToProfile(index):
	packedProfile.id = index
	get_parent().add_child(packedProfile)
	queue_free()
func _on_button_pressed() -> void:
	changeToProfile(0)
	
func _on_button_2_pressed() -> void:
	changeToProfile(1)

func _on_button_3_pressed() -> void:
	changeToProfile(2)
	
func _on_button_4_pressed() -> void:
	changeToProfile(3)

func _on_button_5_pressed() -> void:
	changeToProfile(4)
	
func _on_button_6_pressed() -> void:
	changeToProfile(5)
	
func _on_button_7_pressed() -> void:
	changeToProfile(6)
	
func _on_button_8_pressed() -> void:
	changeToProfile(7)

func _on_pet_creator_create_pet_pressed() -> void:
	self.visible = true
	updateInventory()

func _on_pet_profile_scn_back_to_inv() -> void:
	self.visible = true
	updateInventory()

func _on_breeding_scn_from_breeding_to_inv() -> void:
	self.visible = true
	print("meow")
