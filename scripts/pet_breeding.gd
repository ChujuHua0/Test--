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

func _ready() -> void:
	check_money()
	
func check_money():
	if Player.get_player_money() < 300:
		$Label.add_theme_color_override("font_color","b10b3f")
	elif Player.get_player_money() >= 300:
		$Label.add_theme_color_override("font_color","ffffff")

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
#
func _on_button_2_pressed() -> void:
	breedPet()
	
func breedPet():
	Player.take_player_money(300)
	for i in randi_range(1,4):
		GlobalData.addPetToInventory(PetFactory.create_baby_pet(parent1,parent2))
		check_money()

func previewUpdate():
	check_money()
	print(Player.get_player_money())
	var preview: Array= []
	var previewSlot: Array= [$preview,$preview2,$preview3,$preview4]
	for i in previewSlot.size():
		preview.append(PetFactory.create_baby_pet(parent1,parent2))
		previewSlot[i].update(preview[i])
