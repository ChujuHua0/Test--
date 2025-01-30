extends Control

@onready var id = 1
@onready var texture_clicked = preload("res://pet profile ui/petBackToInvClicked.png")

signal backToInv 
signal toBreeding

func _ready() -> void:
	print("ready")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func updateProfile(pet_data):
	$PetPanel/name.text = pet_data.name
	$PetPanel/baseCoat.text = pet_data.baseFurLabel
	$PetPanel/ID.text = str(pet_data.id)
	$PetPanel/variant1.text = pet_data.variant1Label
	$PetPanel/Eyes.text = pet_data.eyesLabel
	$PetPanel/planetLabel.text = pet_data.planetSign[pet_data.planet]
	$PetPanel/traits.text = pet_data.traitsList[pet_data.trait1] + ", " + pet_data.traitsList[pet_data.trait2] + ", " + pet_data.traitsList[pet_data.trait3] + ", " + pet_data.traitsList[pet_data.trait4]
	id = pet_data.id
	$pet.update(pet_data)

func _on_arrow_profile_left_pressed() -> void:
	id -= 1
	if id < 1:
		id = GlobalData.petInventory.size()
		self.updateProfile(GlobalData.testPetID[id])
	else:
		self.updateProfile(GlobalData.testPetID[id])
	print(id)

func _on_arrow_profile_right_pressed() -> void:
	
	if id > GlobalData.petInventory.size():
		id = 1
		self.updateProfile(GlobalData.testPetID[id])
	else:
		self.updateProfile(GlobalData.testPetID[id])

func _on_rename_pressed() -> void:
	$PetPanel/name.visible = false
	$PetPanel/LineEdit.visible = true

func _on_line_edit_text_submitted(new_text: String) -> void:
	GlobalData.testPetID[id].name = new_text
	self.updateProfile(GlobalData.testPetID[id])
	$PetPanel/name.visible = true
	$PetPanel/LineEdit.visible = false


func _on_pet_inventory_variant_slot_clicked(slot: Variant) -> void:
	self.updateProfile(GlobalData.petInventory[slot])
	self.visible = true
	print("rawr")


func _on_pet_back_to_inv_pressed() -> void:
	$PetBackToInv.icon = texture_clicked
	self.visible = false
	backToInv.emit()


func _on_breed_pet_pressed() -> void:
	self.visible = false
	toBreeding.emit()
