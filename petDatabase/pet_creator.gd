extends Control

signal createPetPressed

@onready var pet_data = petData.new()
@onready var preview = $GridContainer/previewVisualiser
@onready var inventoryNode= load("res://pet_inventory_variant.gd")
@onready var pet = preload("res://petDatabase/Items Scenes/pet.tscn")
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
	pet_data.ownCoatColor = pet_data.limitedCoatColor.pick_random()
	pet_data.ownVariant1Color = pet_data.limitedCoatColor.pick_random()
	pet_data.ownCoatVariant = randi() % 2
	pet_data.ownEyesColor = randf_range(0,9)
	pet_data.name = pet_data.nameRandomList.pick_random()
	$GridContainer/petCreatorUI/LineEdit.text = pet_data.name

	preview.update(pet_data)
	
	# print(pet_data.ownCoatVariant)
	
			
########## Selection ##########

func _on_color_item_selected(index: int) -> void:
	match index:
		0:
			index = 0
		1:
			index = 2
		2:
			index = 5
		3:
			index = 8
		4:
			index = 10
		5:
			index = 13
		6:
			index = 16
		7:
			index = 19
		8:
			index = 22
		9:
			index = 24
	pet_data.ownCoatColor = index
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
	match index:
		0:
			pet_data.trait1 = 0
		1:
			pet_data.trait1 = 5
		2:
			pet_data.trait1 = 15
		3:
			pet_data.trait1 = 16


func _on_qualities_item_selected(index: int) -> void:
	match index:
		0:
			pet_data.trait2 = 2
		1:
			pet_data.trait2 = 8
		2:
			pet_data.trait2 = 10
		3:
			pet_data.trait2 = 18

func _on_planet_choice_item_selected(index: int) -> void:
	pet_data.planet = index


########## Random ##########
########## Create ##########

func _on_pet_create_pressed() -> void:
	pet_data.id += 1
	pet_data.trait3 = pet_data.limitedTraits.pick_random()
	pet_data.trait4 = pet_data.limitedTraits.pick_random()
	GlobalData.pet_global_id+=1
	if GlobalData.testPetID.size() < 8:
		GlobalData.petInventory.append(pet_data.clone())
		GlobalData.testPetID[pet_data.id] = pet_data.clone()
		get_tree().call_group("inventory","updateInventory")
		randomCreatureGenerator()
		createPetPressed.emit()
		self.visible = false
	else:
		print("you already have too much pets!")
		
func randomCreatureGenerator():
	pet_data.id += 1
	pet_data.ownCoatColor = pet_data.coatColorNumber.pick_random()
	pet_data.ownCoatVariant = randi_range(0,1)
	pet_data.ownEyesColor = randi_range(0,9)
	pet_data.name = pet_data.nameRandomList.pick_random()
	GlobalData.pet_global_id+=1
	if GlobalData.testPetID.size() < 8:
		GlobalData.petInventory.append(pet_data.clone())
		GlobalData.testPetID[pet_data.id] = pet_data.clone()
		get_tree().call_group("inventory","updateInventory")
	
