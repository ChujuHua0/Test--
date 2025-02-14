extends Control

@onready var slots: Array= [$"GridContainer/Control/1",$"GridContainer/Control2/2",$"GridContainer/Control3/3",$"GridContainer/Control4/4",$"GridContainer/Control5/5",$"GridContainer/Control6/6",$"GridContainer/Control7/7",$"GridContainer/Control8/8"]
@onready var genders: Array= [$genders/AnimatedSprite2D, $genders/AnimatedSprite2D2, $genders/AnimatedSprite2D3, $genders/AnimatedSprite2D4, $genders/AnimatedSprite2D5, $genders/AnimatedSprite2D6, $genders/AnimatedSprite2D7, $genders/AnimatedSprite2D8, $genders/AnimatedSprite2D9, $genders/AnimatedSprite2D10, $genders/AnimatedSprite2D11, $genders/AnimatedSprite2D12, $genders/AnimatedSprite2D13, $genders/AnimatedSprite2D14, $genders/AnimatedSprite2D15, $genders/AnimatedSprite2D16, $genders/AnimatedSprite2D17, $genders/AnimatedSprite2D18, $genders/AnimatedSprite2D19, $genders/AnimatedSprite2D20, $genders/AnimatedSprite2D21, $genders/AnimatedSprite2D22, $genders/AnimatedSprite2D23, $genders/AnimatedSprite2D24]
@onready var names: Array= [$names/Label, $names/Label2, $names/Label3, $names/Label4, $names/Label5, $names/Label6, $names/Label7, $names/Label8, $names/Label9, $names/Label10, $names/Label11, $names/Label12, $names/Label13, $names/Label14, $names/Label15, $names/Label16, $names/Label17, $names/Label18, $names/Label19, $names/Label20, $names/Label21, $names/Label22, $names/Label23, $names/Label24]
@onready var pet_checkbox: Array=[$pet_check/CheckBox, $pet_check/CheckBox2, $pet_check/CheckBox3, $pet_check/CheckBox4, $pet_check/CheckBox5, $pet_check/CheckBox6, $pet_check/CheckBox7, $pet_check/CheckBox8, $pet_check/CheckBox9, $pet_check/CheckBox10, $pet_check/CheckBox11, $pet_check/CheckBox12, $pet_check/CheckBox13, $pet_check/CheckBox14, $pet_check/CheckBox15, $pet_check/CheckBox16, $pet_check/CheckBox17, $pet_check/CheckBox18, $pet_check/CheckBox19, $pet_check/CheckBox20, $pet_check/CheckBox21, $pet_check/CheckBox22, $pet_check/CheckBox23, $pet_check/CheckBox24]
@onready var pet_checked: Array= []
@onready var is_filtered: bool = false
@onready var filter: String = "nothing"
@onready var freeing_value: int
func _ready() -> void:
	updateInventory()

func hide_irrelevant():
	for i in slots.size():
		slots[i].visible = false
	for i in genders.size():
		genders[i].visible = false
	for i in names.size():
		names[i].visible = false

func uncheck_everything():
	for i in pet_checkbox:
		i.button_pressed = false

func updateInventory():
	if GlobalData.getInventorySize() <= GlobalData.MAX_INVENTORY:
		hide_irrelevant()
		uncheck_everything()
		for i in GlobalData.getInventorySize():
			slots[i].visible = true
			genders[i].visible = true
			names[i].visible = true
			slots[i].update(GlobalData.getPetInventoryAtIndex(i))
			names[i].text = (GlobalData.getPetInventoryAtIndex(i).get_name())
			genders[i].texture_normal =  load("res://assets/pet_inventory_ui/" + GlobalData.getPetInventoryAtIndex(i).get_gender().to_lower() + ".png")
			
	else:
		print("nuh huh")	

func changeToProfile(index):
	var packedProfile: Node= load("res://scenes/pet_profile_scn.tscn").instantiate()
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
	updateInventory()

func _on_pet_profile_scn_back_to_inv() -> void:
	updateInventory()

func _on_breeding_scn_from_breeding_to_inv() -> void:
	print("meow")


func inv_filter(gender_filter: String):
	var filtered: Array[Pet] = []
	if is_filtered == false or gender_filter != filter:
		for i in GlobalData.getInventorySize():
			if GlobalData.getPetInventoryAtIndex(i).get_gender() == gender_filter:
				filtered.append(GlobalData.getPetInventoryAtIndex(i))
		for i in filtered.size():
				slots[i].update(filtered[i])
				names[i].text = (filtered[i].get_name())
				genders[i].texture_normal =  load("res://assets/pet_inventory_ui/" + filtered[i].get_gender().to_lower() + ".png")
		for i in GlobalData.getInventorySize():
			if filtered.size() > 0:
				if i >= filtered.size():
					slots[i].visible = false
					genders[i].visible = false
					names[i].visible = false
					is_filtered = true
				filter = gender_filter
			else:
				updateInventory()
				is_filtered = false
				filter = "no filter"
	elif is_filtered == true and gender_filter == filter:
		updateInventory()
		is_filtered = false
		filter = "no filter"
	else:
		filter = gender_filter
		for i in GlobalData.getInventorySize():
			if GlobalData.getPetInventoryAtIndex(i).get_gender() == gender_filter:
				filtered.append(GlobalData.getPetInventoryAtIndex(i))
		for i in filtered.size():
			slots[i].update(filtered[i])
			names[i].text = (filtered[i].get_name())
			genders[i].texture_normal =  load("res://assets/pet_inventory_ui/" + filtered[i].get_gender().to_lower() + ".png")
		for i in GlobalData.getInventorySize():
				if i >= filtered.size():
					slots[i].visible = false
					genders[i].visible = false
					names[i].visible = false

func _on_boreas_filter_pressed() -> void:
	inv_filter("Boreas")


func _on_zephyrus_filter_pressed() -> void:
	inv_filter("Zephyrus")


func _on_notus_filter_pressed() -> void:
	inv_filter("Notus")


func _on_eurus_filter_pressed() -> void:
	inv_filter("Eurus")


func _on_free_pets_pressed() -> void:
	for i in pet_checkbox.size():
		if pet_checkbox[i].button_pressed == true:
			pet_checked.append(GlobalData.getPetInventoryAtIndex(i))
	freeing_value = 300 * pet_checked.size()
	$freing_pet_popup.visible = true
	$freing_pet_popup/value.text = "You will obtain " + str(freeing_value)
	

func _on_freing_pet_popup_free() -> void:
	for i in pet_checkbox.size():
		if pet_checkbox[i].button_pressed == true:
			GlobalData.removeFromInventory(i - 1)
	$freing_pet_popup.visible = false
	Player.give_player_money(freeing_value)
	print(Player.get_player_money())
	updateInventory()
