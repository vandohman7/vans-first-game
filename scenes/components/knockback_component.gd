extends Node2D
class_name KnockbackComponent

@export_category('Stats')
#@export var max_health: float = 10

#signal health_is_zero

#var health: float = 10


#func _ready() -> void:
	#health = max_health
#
func do_knockback(_amount: float):
	print("_amount " + str(_amount))
	
	# how do i reference the node im attached and add velocity
	# how do i figure out which way to do the velocity
	pass

#
#
#
#func heal_damage(amount: float):
	#health = health + amount
	#health_changed()
#
	#
#func health_changed():
	#health = clamp(health,0,max_health)
	##print(health)
	#if health <= 0:
		#print("DEAD")
		#health_is_zero.emit()
		#
	#
