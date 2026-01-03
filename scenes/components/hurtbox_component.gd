extends Area2D




func _on_area_entered(area: Area2D) -> void:
	print("hurtbox sees something", area.name)
	if area is HitboxComponent:
		var hitbox = area as HitboxComponent
		print("doing 50 damage to ", area.name)
		hitbox.damage(50)
