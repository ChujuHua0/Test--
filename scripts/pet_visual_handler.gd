extends Node2D

func update(pet_data) -> void:
	match pet_data.ownCoatVariant:
		0: 
			$coat.play("coatDefault")
		1:
			$coat.play("shifting")
	match pet_data.ownCoatVariant1:
		0:
			$variant_1.play("earsDefault")
		1:
			$variant_1.play("colour_point")
		2:
			$variant_1.play("spiruline")
	match pet_data.ownEyesVariant:
		0:
			$eyes.play("eyesDefault")
		1:
			$eyes.play("odd_eyes")

	$coat.set_frame(pet_data.ownCoatColor)
	$ears.set_frame(pet_data.ownVariant1Color)
	$eyes.set_frame(pet_data.ownEyesColor)
	$sclera.set_frame(pet_data.ownEyesColor)
			
