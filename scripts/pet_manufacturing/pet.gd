extends Resource
class_name Pet

var name: String= "Unnamed"
var age: String
var gender: int
var race = "Abysskitti"
var planet: int
# Traits owned

var trait1: int
var trait2: int
var trait3: int
var trait4: int

# Color
var ownCoatColor: int
var ownVariant1Color: int
var ownVariant2Color: int
var ownEyesColor: int
var ownSclerasColor: int

# Genes
var ownCoatVariant: int
var ownCoatVariant1: int
var ownCoatVariant2: int
var ownEyesVariant: int

# when clicking create =

func clone() -> Pet:
	var pet = Pet.new()
	pet.name = self.name
	pet.age = self.age
	pet.gender = self.gender
	pet.race = self.race
	pet.planet = self.planet
	pet.trait1 = self.trait1
	pet.trait2 = self.trait2
	pet.trait3 = self.trait3
	pet.trait4 = self.trait4
	
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
