extends Control
class_name PetProfile


static var id: int

@onready var texture_clicked: Texture= preload("res://assets/pet_profile_ui/profile_to_inv_pressed.png")
@onready var packed_inventory: Node= load("res://scenes/pet_inventory.tscn").instantiate()
@onready var packed_breed: Node= load("res://scenes/Breeding.tscn").instantiate()


func _enter_tree() -> void:
	updateProfile(GlobalData.getPetInventoryAtIndex(id))
	
func updateProfile(pet_data: Pet):
	$PetPanel/Flux.text = pet_data.get_gender()
	$PetPanel/name.text = pet_data.get_name()
	$PetPanel/baseCoat.text = pet_data.show_coat()
	$PetPanel/variant1.text = pet_data.show_variant(0)
	$PetPanel/variant2.text = pet_data.show_variant(1)
	$PetPanel/variant3.text = pet_data.show_variant(2)
	$PetPanel/Eyes.text = pet_data.show_eyes()
	$PetPanel/planetLabel.text = pet_data.get_planet()
	$PetPanel/traits.text = pet_data.show_traits()
	$PetPanel/age.text = pet_data.show_age()
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

func _on_line_edit_text_submitted(new_text: String) -> void:
	GlobalData.getPetInventoryAtIndex(id).set_name(new_text)
	$PetPanel/name.visible = true
	$PetPanel/LineEdit.visible = false
	self.updateProfile(GlobalData.getPetInventoryAtIndex(id))


func _on_pet_back_to_inv_pressed() -> void:
	$PetBackToInv.icon = texture_clicked
	get_parent().add_child(packed_inventory)
	queue_free()


func _on_breed_pet_pressed() -> void:
	get_parent().add_child(packed_breed)
	queue_free()

func _on_control_new_day() -> void:
	Player.new_day()
	updateProfile(GlobalData.getPetInventoryAtIndex(id))
