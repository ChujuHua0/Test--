extends Control

var id: int
@onready var texture_clicked: Texture= preload("res://assets/pet_profile_ui/profile_to_inv_pressed.png")
@onready var packed_inventory: Node= load("res://scenes/pet_inventory.tscn").instantiate()
@onready var packed_breed: Node= load("res://scenes/Breeding.tscn").instantiate()

signal backToInv 
signal toBreeding

func _enter_tree() -> void:
	updateProfile(GlobalData.getPetInventoryAtIndex(id))
	
func updateProfile(pet_data: Pet):
	$PetPanel/Flux.text = PetFactory.GENDERS[pet_data.gender]
	$PetPanel/name.text = pet_data.name
	$PetPanel/baseCoat.text = PetFactory.COAT_VARIANTS[pet_data.ownCoatVariant] + " " + PetFactory.COLOR_LIST[pet_data.ownCoatColor]
	$PetPanel/variant1.text = PetFactory.COAT_VARIANTS[pet_data.ownCoatVariant1] + " " + PetFactory.COLOR_LIST[pet_data.ownVariant1Color]
	$PetPanel/Eyes.text = PetFactory.EYE_VARIANTS[pet_data.ownEyesVariant] + " " + PetFactory.EYE_COLORS[pet_data.ownEyesColor]
	$PetPanel/planetLabel.text = PetFactory.PLANET_SIGNS[pet_data.planet]
	$PetPanel/traits.text = PetFactory.TRAITS[pet_data.trait1] + ", " + PetFactory.TRAITS[pet_data.trait2] + ", " + PetFactory.TRAITS[pet_data.trait3] + ", " + PetFactory.TRAITS[pet_data.trait4]
	$pet.update(pet_data)

func _on_arrow_profile_left_pressed() -> void:
	id = (id-1) % GlobalData.getInventorySize()
	self.updateProfile(GlobalData.getPetInventoryAtIndex(id))
	
func _on_arrow_profile_right_pressed() -> void:
	id = (id+1) % GlobalData.getInventorySize()
	self.updateProfile(GlobalData.getPetInventoryAtIndex(id))

func _on_rename_pressed() -> void:
	$PetPanel/name.visible = false
	$PetPanel/LineEdit.visible = true

#func _on_line_edit_text_submitted(new_text: String) -> void:
	#GlobalData.testPetID[id].name = new_text
	#self.updateProfile(GlobalData.testPetID[id])
	#$PetPanel/name.visible = true
	#$PetPanel/LineEdit.visible = false


func _on_pet_back_to_inv_pressed() -> void:
	$PetBackToInv.icon = texture_clicked
	get_parent().add_child(packed_inventory)
	queue_free()


func _on_breed_pet_pressed() -> void:
	get_parent().add_child(packed_breed)
	queue_free()

	
