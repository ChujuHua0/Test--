extends Node

class_name PetFactory

const COLORS: Array= ["Twilight", "Shadow", "Ember", "Crimson", "Charm", "Magenta", "Wisteria", "Dew", "Cotton", "White", "Sand", "Ecru", "Caramel", "Earth", "Sunset", "Honey", "Light", "Chartreux", "Verdance", "Lemonade", "Electrify", "Teal", "Moss", "Ash", "Steel", "Sky"]
const EYE_COLORS: Array= ["Green","Purple","Pink","Gold","Sky","Grey","Orange","Red","White","Black"]

# Variant 1 + eye Variant
const VARIANTS: Dictionary= {"eyes":["Normal", "Odd"], "coat":["Normal","Shifting"], "variant1":["Normal", "Color Point", "Spiruline"], "variant2":["Normal", "Royal Star"]}

# Names
const RANDOM_NAME: Array=["Prism", "Luminix", "Lyra", "Cassiopeia", "Spectrix", "Andromeda", "Fractis", "Lustrea","Xenith", "Chroma","Nebula", "Astris", "Vega", "Lunae", "Nova","Orion", "Zypher", "Comet", "Eclipse", "Stellarion","Willow","Purpura","Lila","Celestine","Loomi"]

# Traits 
					# Common
const TRAITS: Array= ["Aloof", "Allergic","Curious","Cold Sensitive", "Heat Sensitive", "Clumsy", "Greedy", "Agile","Loyal", "Velvet Paws","Charming", "Empathy", "Lively",
					# Uncommon
"Lucky charm", "Forager", "Stubborn", "Timid", "Rare Coat", "Playful", "Hoarder", "Miner", "Fighter", "Guardian",
					# Rare
"Heat Resistant", "Cold resistant", "Regeneration","Invisibility","Strong", "Fragile Bones", "Sensitive", "Nocturnal", "Night Vision",
					# Epic
"Immortal","Cursed","Doomed","Blessed", "Star Child", "Melanistic", "Albinos"]

const GENDERS: Array= ["Boreas","Zephyrus","Notus","Eurus"]
const PLANET_SIGNS: Array= ["Lorchi", "Solune","Nebraxys","Eclatène"]


# For pet creation
const LIMITED_COAT_COLORS = [1,3,6,9,11,14,17,20,23,25]
const LIMITED_QUALITIES = [2,8,10,18]
const LIMITED_FLAWS = [0, 5, 15, 16]
const LIMITED_TRAITS = LIMITED_QUALITIES + LIMITED_FLAWS
const LIMITED_COAT_VARIANTS = [0,1]

# Pet Factory :)

static func create_random_limited_pet() -> Pet:
	var pet: Pet = Pet.new()
	pet.set_coat(PetAnimation.new(VARIANTS.coat.pick_random(), LIMITED_COAT_COLORS.pick_random()))
	pet.set_eyes(PetAnimation.new(null, randi_range(0, EYE_COLORS.size()-1)))
	pet.set_name(RANDOM_NAME.pick_random())
	while pet.get_traits().size() < 4:
		pet.add_trait(TRAITS[LIMITED_TRAITS.pick_random()])
	pet.set_gender(GENDERS.pick_random())
	pet.set_planet(PLANET_SIGNS.pick_random())
	return pet

static func create_companion_pet() -> Pet:
	var pet: Pet = Pet.new()
	pet.set_coat(PetAnimation.new(VARIANTS.coat.pick_random(), randi_range(0, COLORS.size()-1)))
	pet.set_eyes(PetAnimation.new(null, randi_range(0, EYE_COLORS.size()-1)))
	pet.set_name(RANDOM_NAME.pick_random())
	while pet.get_traits().size() < 4:
		pet.add_trait(TRAITS.slice(0,13).pick_random())
	pet.set_gender(GENDERS.pick_random())
	pet.set_planet(PLANET_SIGNS.pick_random())
	return pet

static func create_baby_pet(parent_1: Pet, parent_2: Pet) -> Pet:
	var pet: Pet = Pet.new()
	var common: int= randi_range(1,10)
	var uncommon: int= randi_range(1,30)
	var rare: int= randi_range(1,60)
	var epic: int= randi_range(1,100)
	var RARITIES: Dictionary= {"Normal" = common, "Shifting" = uncommon,"Color Point" = uncommon, "Spiruline" = rare, "Odd" = rare,"Royal Star" = rare}
	
	pet.set_gender(GENDERS.pick_random())
	# COAT
	if parent_1.get_coat() == parent_2.get_coat():
		
		pet.set_coat(parent_1.get_coat())
	else:

		if RARITIES[parent_1.get_coat().get_anim()] < RARITIES[parent_2.get_coat().get_anim()]:
			pet.set_coat(PetAnimation.new(parent_1.get_coat().get_anim(),0))
		else:
			pet.set_coat(PetAnimation.new(parent_1.get_coat().get_anim(),0))
			
			if parent_1.get_coat().get_frame() == parent_2.get_coat().get_frame():
				pet.set_coat(PetAnimation.new(pet.get_coat().get_anim(), parent_1.get_coat().get_frame()))
			else:
				pet.set_coat(PetAnimation.new(pet.get_coat().get_anim(),randi_range(parent_1.get_coat().get_frame(),parent_2.get_coat().get_frame())))
				
				
	if RARITIES[parent_1.get_eyes().get_anim()] < RARITIES["Odd"] or RARITIES[parent_2.get_eyes().get_anim()]< RARITIES["Odd"]:
		if RARITIES[parent_1.get_eyes().get_anim()] == RARITIES[parent_2.get_eyes().get_anim()] or RARITIES[parent_1.get_eyes().get_anim()] < RARITIES[parent_2.get_eyes().get_anim()] :
			pet.set_eyes(PetAnimation.new(parent_1.get_eyes().get_anim(),0))
		else:
			pet.set_eyes(PetAnimation.new(parent_2.get_eyes().get_anim(),0))
		if COLORS[parent_1.get_eyes().get_frame()] == COLORS[parent_2.get_eyes().get_frame()]:
			pet.set_eyes(PetAnimation.new(pet.get_eyes().get_anim(),parent_1.get_eyes().get_frame()))
		else:
			var parentEyes: Array= [parent_1.get_eyes().get_frame(), parent_2.get_eyes().get_frame()]
			pet.set_eyes(PetAnimation.new(pet.get_eyes().get_anim(),parentEyes.pick_random()))
	else:
		if COLORS[parent_1.get_eyes().get_frame()] == COLORS[parent_2.get_eyes().get_frame()]:
			pet.set_eyes(PetAnimation.new("Odd",parent_1.get_eyes().get_frame()))
		else:
			var parentEyes: Array= [parent_1.get_eyes().get_frame(), parent_2.get_eyes().get_frame()]
			pet.set_eyes(PetAnimation.new("Odd",parentEyes.pick_random()))
			
	pet.set_planet(PLANET_SIGNS.pick_random())
	while pet.get_traits().size() < 2:
		pet.add_trait(TRAITS.slice(0,13).pick_random())
	while pet.get_traits().size() <4:
		pet.add_trait(TRAITS.slice(0,25).pick_random())
	return pet
