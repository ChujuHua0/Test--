extends Control

signal createPetPressed

@onready var pet_data : Pet = Pet.new()
@onready var preview: Control= $GridContainer/previewVisualiser
@onready var pet: PackedScene= preload("res://scenes/pet.tscn")
##########   Ready   ##########

func _ready() -> void:
	make_option_button_items_non_radio_checkable($GridContainer/petCreatorUI/Color)
	make_option_button_items_non_radio_checkable($GridContainer/petCreatorUI/Variant)
	make_option_button_items_non_radio_checkable($GridContainer/petCreatorUI/Eyes)
	make_option_button_items_non_radio_checkable($GridContainer/petCreatorUI/Flux)
	
func make_option_button_items_non_radio_checkable(option_button: OptionButton) -> void:
	var pm: PopupMenu = option_button.get_popup()
	for i in pm.get_item_count():
		if pm.is_item_radio_checkable(i):
			pm.set_item_as_radio_checkable(i, false)

# Randomize all things on ready

	randomize()
	pet_data.ownCoatColor = PetFactory.LIMITED_COAT_COLORS.pick_random()
	pet_data.ownVariant1Color = PetFactory.LIMITED_COAT_COLORS.pick_random()
	pet_data.ownCoatVariant = randi_range(0,PetFactory.LIMITED_COAT_VARIANTS.size()-1)
	pet_data.ownEyesColor = randi_range(0, PetFactory.EYE_COLORS.size()-1)
	pet_data.name = PetFactory.RANDOM_NAME.pick_random()
	$GridContainer/petCreatorUI/LineEdit.text = pet_data.name

	preview.update(pet_data)
	
########## Selection ##########

func _on_color_item_selected(index: int) -> void:
	pet_data.ownCoatColor = PetFactory.LIMITED_COAT_COLORS[index]
	preview.update(pet_data)
	
func _on_variant_item_selected(index: int) -> void:
	pet_data.ownCoatVariant = index
	preview.update(pet_data)
	
func _on_eyes_item_selected(index: int) -> void:
	pet_data.ownEyesColor = index
	preview.update(pet_data)

func _on_line_edit_text_changed(new_text: String) -> void:
	pet_data.name = new_text
	preview.update(pet_data)
	
	
func _on_flaws_item_selected(index: int) -> void:
	pet_data.trait1 = PetFactory.LIMITED_FLAWS[index]



func _on_qualities_item_selected(index: int) -> void:
	pet_data.trait2 = PetFactory.LIMITED_QUALITIES[index]

func _on_planet_choice_item_selected(index: int) -> void:
	pet_data.planet = index

func _on_flux_item_selected(index: int) -> void:
	pet_data.gender = index

########## Random ##########
########## Create ##########

func _on_pet_create_pressed() -> void:
	pet_data.trait3 = PetFactory.LIMITED_TRAITS.pick_random()
	pet_data.trait4 = PetFactory.LIMITED_TRAITS.pick_random()
	if GlobalData.addPetToInventory(pet_data.clone()):
		get_tree().call_group("Inventory","updateInventory")
		randomCreatureGenerator()
		createPetPressed.emit()
		self.visible = false
	else:
		print("you already have too much pets!")
		
func randomCreatureGenerator():
	pet_data.ownCoatColor = randi_range(0,PetFactory.COLOR_LIST.size()-1)
	pet_data.ownCoatVariant = randi_range(0,PetFactory.COAT_VARIANTS.size()-1)
	pet_data.ownEyesColor = randi_range(0,PetFactory.EYE_COLORS.size()-1)
	pet_data.name = PetFactory.RANDOM_NAME.pick_random()
	if GlobalData.addPetToInventory(pet_data.clone()):
		get_tree().call_group("Inventory","updateInventory")
	else:
		print("you already have too much pets!")
