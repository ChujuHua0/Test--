class_name Pet

var _name: String = "Unnamed"
var _age: int = 0
var _gender: String
var _race: String = "Abysskitti"
var _planet: String

# Traits owned

var _traits: Array[String] = []

# Pet Anims + Frames

var _coat: PetAnimation
var _variant: Array[PetAnimation]= [PetAnimation.new(null,0),PetAnimation.new(null,0),PetAnimation.new(null,0)]
var _eyes: PetAnimation
var _sclera: PetAnimation = PetAnimation.new("Normal", 0)

# Attributs

var _attack: int
var _defense: int
var _speed: int
var _intelligence: int

# when clicking create =

func clone() -> Pet:
	var pet = Pet.new()
	pet.name = self.name
	pet.age = self.age
	pet.gender = self.gender
	pet.race = self.race
	pet.planet = self.planet
	pet.traits = self.traits
	
	pet.ownCoatColor = self.ownCoatColor
	pet.ownVariant1Color = self.ownVariant1Color
	pet.ownVariant2Color = self.ownVariant2Color
	pet.ownEyesColor = self.ownEyesColor
	pet.ownSclerasColor = self.ownSclerasColor

	pet.ownCoatVariant = self.ownCoatVariant
	pet.ownCoatVariant1 = self.ownCoatVariant1
	pet.ownCoatVariant2 = self.ownCoatVariant2
	pet.ownEyesVariant = self.ownEyesVariant

	return pet

# GETTERS

func get_name() -> String:
	return self._name
	
func get_age() -> int:
	return self._age

func get_gender() -> String:
	return self._gender
	
func get_race() -> String:
	return self._race
	
func get_planet() -> String:
	return self._planet
	
func get_traits() -> Array:
	return self._traits
	
func get_coat() -> PetAnimation:
	return self._coat
	
func get_variant(index: int) -> PetAnimation:
	return self._variant[index]
	
func get_eyes() -> PetAnimation:
	return self._eyes
	
func get_sclera() -> PetAnimation:
	return self._sclera

# SETTERS
	
func set_name(name: String) -> void:
	self._name = name

func set_age(age: int) -> void:
	self._age = age
	
func add_trait(t: String) -> void:
	if not _traits.has(t):
		self._traits.append(t)

func set_coat(coat: PetAnimation) -> void:
	self._coat = coat

func add_variant(variant: PetAnimation) -> void:
	self._variant.append(variant)

func set_eyes(eyes: PetAnimation) -> void:
	self._eyes = eyes

func set_sclera(sclera: PetAnimation) -> void:
	self._sclera = sclera

func set_gender(gender: String) -> void:
	self._gender = gender
	
func set_planet(planet: String) -> void:
	self._planet = planet

# SHOWERS :)

func show_traits() -> String:
	return ", ".join(_traits)

func show_coat() -> String:
	return get_coat().get_anim() + " " + PetFactory.COLORS[get_coat().get_frame()]
	
func show_variant(index: int) -> String:
	return get_variant(index).get_anim() + " " + PetFactory.COLORS[get_variant(index).get_frame()]
	
func show_eyes() -> String:
	return get_eyes().get_anim() + " " + PetFactory.EYE_COLORS[get_eyes().get_frame()]

func show_age() -> String:
	return str(get_age()) + " cycle(s)"
