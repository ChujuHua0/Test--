extends Resource
class_name petData

var name: String
var age: String
var id: int
var gender: String
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

var colorList: Array= ["Twilight", "Shadow", "Ember", "Crimson", "Charm", "Magenta", "Wisteria", "Dew", "Cotton", "White", "Sand", "Ecru", "Caramel", "Earth", "Sunset", "Honey", "Light", "Chartreux", "Verdance", "Lemonade", "Electrify", "Teal", "Moss", "Ash", "Steel", "Sky"]
var coatColorNumber = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25]
var eyeColorList: Array= ["Green","Purple","Pink","Gold","Sky","Grey","Orange","Red","White","Black"]
var CoatvariantList: Array= ["Normal","Shifting"]
var CoatvariantNumber = [0,1]

# Variant 1 + eye Variant
var variantList1: Array= ["Normal","Calico"]
var eyeVariantList: Array= ["Empty","Starry"]

# Names

var nameRandomList: Array=["Prism", "Luminix", "Lyra", "Cassiopeia", "Spectrix", "Andromeda", "Fractis", "Lustrea","Xenith", "Chroma","Nebula", "Astris", "Vega", "Lunae", "Nova","Orion", "Zypher", "Comet", "Eclipse", "Stellarion","Willow","Purpura","Lila","Celestine","Loomi"]
var genderList: Array= ["Boreas","Zephyrus","Notus","Eurus"]

# Traits 
						# Common
var traitsList: Array= ["Aloof", "Allergic","Curious","Cold Sensitive", "Heat Sensitive", "Clumsy", "Greedy", "Agile", "Loyal", "Velvet Paws","Charming", "Empathy", "Lively",
						# Uncommon
"Lucky charm", "Forager", "Stubborn", "Timid", "Rare Coat", "Playful", "Hoarder", "Miner", "Fighter", "Guardian",
						# Rare
"Heat Resistant", "Cold resistant", "Regeneration","Invisibility","Strong", "Fragile Bones", "Sensitive", "Nocturnal", "Night Vision"
						# Epic

,"Immortal","Cursed","Doomed","Blessed", "Star Child", "Melanistic", "Albinos"]

# Planets 

var planetSign: Array= ["Lorchi", "Solune","Nebraxys","Eclatène"]

# Labels
var baseFurLabel: String
var variant1Label: String
var variant2Label: String
var eyesLabel: String 
# For pet creation

var limitedCoatColor = [1,3,6,9,11,14,17,20,23,25]
var limitedQuality = [2,8,10,18]
var limitedFlaw = [0, 5, 15, 16]
var limitedTraits = [2,8,10,18,0,5,15,16]

# when clicking create =

func clone() -> petData:
	var pet = petData.new()
	pet.name = self.name
	pet.age = self.age
	pet.id = self.id
	pet.gender = self.gender
	pet.race = self.race
	pet.planet = self.planet
	pet.trait1 = self.trait1
	pet.trait2 = self.trait2
	pet.trait3 = self.trait3
	pet.trait4 = self.trait4
	
	pet.ownCoatColor = self.ownCoatColor
	pet.ownVariant1Color = self.ownVariant1Color
	pet.ownEyesColor = self.ownEyesColor
	pet.ownSclerasColor = self.ownSclerasColor

	pet.ownCoatVariant = self.ownCoatVariant
	pet.ownCoatVariant1 = self.ownCoatVariant1
	pet.ownCoatVariant2 = self.ownCoatVariant2
	pet.ownEyesVariant = self.ownEyesVariant
	
	pet.baseFurLabel = CoatvariantList[pet.ownCoatVariant] + " " + colorList[pet.ownCoatColor]
	pet.variant1Label = variantList1[pet.ownCoatVariant1] + " " + colorList[pet.ownVariant1Color]
	pet.eyesLabel = eyeVariantList[1] + " " + eyeColorList[pet.ownEyesColor]
	return pet
