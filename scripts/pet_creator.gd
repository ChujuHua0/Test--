extends Control


@onready var pet_data: Pet = PetFactory.create_random_limited_pet()
@onready var preview: Control= $GridContainer/previewVisualiser
@onready var pet: PackedScene= preload("res://scenes/pet.tscn")
@onready var inventory: Node= load("res://scenes/pet_inventory.tscn").instantiate()
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
	$GridContainer/petCreatorUI/LineEdit.text = pet_data.get_name()
	$GridContainer/petCreatorUI/Color.select(randi_range(0,$GridContainer/petCreatorUI/Color.get_item_count()-1))
	$GridContainer/previewVisualiser/pet.update(pet_data)
	
########## Selection ##########

func _on_color_item_selected(index: int) -> void:
	pet_data.set_coat(PetAnimation.new(pet_data.get_coat().get_anim(), PetFactory.LIMITED_COAT_COLORS[index]))
	$GridContainer/previewVisualiser/pet.update(pet_data)
	
func _on_variant_item_selected(index: int) -> void:
	pet_data.set_coat(PetAnimation.new(PetFactory.VARIANTS.coat[index], pet_data.get_coat().get_frame()))
	$GridContainer/previewVisualiser/pet.update(pet_data)
	
func _on_eyes_item_selected(index: int) -> void:
	pet_data.set_eyes(PetAnimation.new(pet_data.get_eyes().get_anim(),index))
	$GridContainer/previewVisualiser/pet.update(pet_data)

func _on_line_edit_text_changed(new_text: String) -> void:
	pet_data.set_name(new_text)
	$GridContainer/previewVisualiser/pet.update(pet_data)
	
	
func _on_flaws_item_selected(index: int) -> void:
	pet_data.add_trait(PetFactory.TRAITS[PetFactory.LIMITED_FLAWS[index]])



func _on_qualities_item_selected(index: int) -> void:
	pet_data.add_trait(PetFactory.TRAITS[PetFactory.LIMITED_QUALITIES[index]])


func _on_planet_choice_item_selected(index: int) -> void:
	pet_data.set_planet(PetFactory.PLANET_SIGNS[index])
	
func _on_flux_item_selected(index: int) -> void:
	pet_data.set_gender(PetFactory.GENDERS[index])


########## Create ##########

func _on_pet_create_pressed() -> void:
	GlobalData.addPetToInventory(pet_data)
	GlobalData.addPetToInventory(PetFactory.create_companion_pet())
	get_parent().add_child(inventory)
	queue_free()
