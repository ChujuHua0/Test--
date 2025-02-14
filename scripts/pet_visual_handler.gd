extends Node2D


func update(pet_data: Pet) -> void:
	$coat.play(pet_data.get_coat().get_anim())
	$coat.set_frame(pet_data.get_coat().get_frame())
	
	$variant_1.play(pet_data.get_variant(0).get_anim())
	$variant_1.set_frame(pet_data.get_variant(0).get_frame())
	
	$variant_2.play(pet_data.get_variant(1).get_anim())
	$variant_2.set_frame(pet_data.get_variant(1).get_frame())
	
	$eyes.play(pet_data.get_eyes().get_anim())
	$eyes.set_frame(pet_data.get_eyes().get_frame())
	
	$sclera.play(pet_data.get_sclera().get_anim())
	$sclera.set_frame(pet_data.get_sclera().get_frame())

	#$variant_1.set_frame(pet_data.ownVariant1Color)
	#$eyes.set_frame(pet_data.ownEyesColor)
	#$sclera.set_frame(pet_data.ownEyesColor)
			#
