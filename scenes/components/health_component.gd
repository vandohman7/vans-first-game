extends Node2D
class_name HealthComponent

@export_category('Stats')
@export var max_health: float = 10
var health: float = 10


func _ready() -> void:
	health = max_health

func take_damage(amount: float):
	health = health - amount
	health_changed()

func heal_damage(amount: float):
	health = health + amount
	health_changed()

	
func health_changed():
	health = clamp(health,0,max_health)
	print(health)
	if health <= 0:
		get_parent().queue_free()
	
