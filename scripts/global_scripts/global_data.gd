extends Node2D

class_name GlobalData

#static var pet_global_id : int
static var _petInventory: Array[Pet]= []
const MAX_INVENTORY: int = 8
#static var testPetID: Dictionary= {}

static func getPetInventoryAtIndex(index: int) -> Pet:
	return _petInventory[index]

static func getInventorySize() -> int:
	return _petInventory.size()

static func addPetToInventory(pet: Pet) -> bool:
	if getInventorySize() < MAX_INVENTORY:
		_petInventory.append(pet)
		return true
	return false
	
static func removeFromInventory(index: int):
	_petInventory.remove_at(index)
