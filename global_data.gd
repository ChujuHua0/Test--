extends Node2D

class_name globalData

var pet_global_id : int
var petInventory = []
var testPetID = {}

func getPetInventoryAtIndex(index: int):
	return self.petInventory[index]
	
	
