extends Control

@onready var pet = preload("res://scenes/pet.tscn")
@onready var coat = $"pet/coat"
@onready var variant1 = $"pet/variant_1"
@onready var eyes = $"pet/eyes"
@onready var sclera = $"pet/sclera"

func update(pet_data) -> void:
	match pet_data.ownCoatVariant:
		0: 
			coat.play("normal_coat")
		1:
			coat.play("shifting_coat")
	match pet_data.ownCoatVariant1:
		0:
			variant1.play("normal_variant1")
		1:
			variant1.play("royal_stars")
	match pet_data.ownEyesVariant:
		0:
			eyes.play("default_eyes")
		1:
			eyes.play("odd_eyes")
	coat.set_frame(pet_data.ownCoatColor)
	variant1.set_frame(pet_data.ownVariant1Color)
	eyes.set_frame(pet_data.ownEyesColor)
	sclera.set_frame(pet_data.ownEyesColor)
