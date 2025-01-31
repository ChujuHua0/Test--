extends Node2D

var slot_num : Vector2i
var pet_data = Pet.new()
var item = {}
var item_count = pet_data.petInSlot

func add_pet(Pet):
	if item == {} or item_count < 1:
		item_count+= 1
		return true
	return false
	
