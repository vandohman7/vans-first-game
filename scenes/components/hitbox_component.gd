extends Area2D
class_name HitboxComponent

@export var health_component: HealthComponent
@export var knock_component: KnockbackComponent


#func damage(amount: float, _knockbackAmount: float):
func damage(amount: float, _knockbackAmount: float = 5):
	if health_component:
		health_component.take_damage(amount)
	if knock_component:
		knock_component.do_knockback(5)
