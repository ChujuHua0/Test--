extends Control


@onready var packed_inventory: Node= load("res://scenes/pet_inventory.tscn").instantiate()
@onready var parent1: Pet= Pet.new()
@onready var parent2: Pet= Pet.new()
@onready var pet: Pet= Pet.new()

# Baby variables declaration
var babyCoatColor: int
var babyVariant1Color: int
var babyVariant2Color: int
var babyEyesColor: int

var babyCoatVariant: int
var babyCoatVariant1: int
var babyCoatVariant2: int
var babyEyesVariant: int

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("Escape"):
		get_parent().add_child(packed_inventory)
		queue_free()

func updateProfile(pet):
	$pet.update(pet)
	print(pet.name)

func _on_id_search_2_text_changed(new_text: String) -> void:
	var index = int(new_text)-1
	if(index <= GlobalData.getInventorySize()):
		var data: Pet= GlobalData.getPetInventoryAtIndex(index)
		$pet2.update(data)
		parent2 = data
	else:
		print("retry")

func _on_id_search_text_changed(new_text: String) -> void:
	var index: int= int(new_text) -1
	if(index <= GlobalData.getInventorySize()):
		var data: Pet= GlobalData.getPetInventoryAtIndex(index)
		$pet.update(data)
		parent1 = data
	else:
		print("retry")

func _on_button_pressed() -> void:
	if parent1 != parent2:
		previewUpdate()

func coatColor():
	if parent1.ownCoatColor == parent2.ownCoatColor:
		return parent1.ownCoatColor
	if parent1.ownCoatColor < parent2.ownCoatColor:
		return randi_range(parent1.ownCoatColor, parent2.ownCoatColor)
	else:
		return randi_range(parent1.ownCoatColor, parent2.ownCoatColor)

func coatVariant():
	if parent1.ownCoatVariant == parent2.ownCoatVariant:
		return parent1.ownCoatVariant
	
	var normal: int= randi_range(1,10)
	var shifting: int= randi_range(1,30)
	return 0 if normal <= shifting else 1

func _on_button_2_pressed() -> void:
	breedPet()
	
func breedPet():
	for i in randi_range(1,4):
		pet.ownCoatColor = coatColor()
		pet.ownCoatVariant = coatVariant()
		pet.ownEyesColor = [parent1.ownEyesColor, parent2.ownEyesColor].pick_random()
		GlobalData.addPetToInventory(pet.clone())
		packed_inventory.updateInventory()

func previewUpdate():
	pet = Pet.new()
	var preview: Array= []
	var previewSlot: Array= [$preview,$preview2,$preview3,$preview4]
	for i in previewSlot.size():
		pet.ownCoatVariant = coatVariant()
		pet.ownCoatColor = coatColor()
		pet.ownEyesColor = [parent1.ownEyesColor, parent2.ownEyesColor].pick_random()
		preview.append(pet.clone())
		previewSlot[i].update(preview[i])
