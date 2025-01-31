extends Node

class_name PetFactory

const COLOR_LIST: Array= ["Twilight", "Shadow", "Ember", "Crimson", "Charm", "Magenta", "Wisteria", "Dew", "Cotton", "White", "Sand", "Ecru", "Caramel", "Earth", "Sunset", "Honey", "Light", "Chartreux", "Verdance", "Lemonade", "Electrify", "Teal", "Moss", "Ash", "Steel", "Sky"]
const EYE_COLORS: Array= ["Green","Purple","Pink","Gold","Sky","Grey","Orange","Red","White","Black"]
const COAT_VARIANTS: Array= ["Normal","Shifting"]

# Variant 1 + eye Variant
const VARIANT_1: Array= ["Normal","Calico"]
const EYE_VARIANTS: Array= ["Empty","Starry"]

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
const LIMITED_TRAITS = [2,8,10,18,0,5,15,16]
const LIMITED_COAT_VARIANTS = [0,2]
