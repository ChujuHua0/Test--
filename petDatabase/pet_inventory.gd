extends Control


@onready var creator = %"Pet Creator"
@onready var pet = $ItemList
@onready var petClicked = load("res://petDatabase/Items Scenes/pet.tscn")
@onready var petProfile = $"../PetProfile"
@onready var tabs = %sceneTabs



func _on_item_list_item_clicked(index: int, _at_position: Vector2, _mouse_button_index: int) -> void:
	var profileLoaded = index
	petProfile.updateProfile(GlobalData.petInventory[profileLoaded])
	print(GlobalData.petInventory[index].name)
	tabs.select_next_available()
