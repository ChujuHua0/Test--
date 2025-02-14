class_name Player

# Money 
static var _golden_wheat: int = 300

# Gems
static var _abyss_gems: int = 1

# Days

static var _days: int = 1

func show_days() -> String:
	return str(_days) + "Cycle(s)"
	
static func new_day():
	_days+=1
	for i in GlobalData.getInventorySize():
		GlobalData.getPetInventoryAtIndex(i).set_age(GlobalData.getPetInventoryAtIndex(i).get_age()+1)

static func get_player_money():
	return _golden_wheat

static func take_player_money(money: int):
	_golden_wheat = _golden_wheat - money
	
static func give_player_money(money: int):
	_golden_wheat += money
	return _golden_wheat
