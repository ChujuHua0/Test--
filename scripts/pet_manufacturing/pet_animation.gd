class_name PetAnimation

var _anim: String = "Normal"
var _frame: int

func _init(anim, frame:int):
	self._anim = anim if anim != null else self._anim
	self._frame = frame

func get_anim() -> String:
	return self._anim
	
func get_frame() -> int:
	return self._frame
	
#func _init(frame: int) -> void:
	#self._frame = frame
