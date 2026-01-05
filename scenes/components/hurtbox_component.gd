class_name HurtboxComponent
extends Area2D


@export_category('Stats')
@export var hurtbox_damage: float = 10



func _on_area_entered(area: Area2D) -> void:
	if area is HitboxComponent:
		print("hurtbox sees HitboxComponent ", area.name)
		var _hitbox = area as HitboxComponent
		_hitbox.damage(hurtbox_damage)
