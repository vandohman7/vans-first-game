extends RigidBody2D

@onready var health_component: HealthComponent = $HealthComponent

func _ready() -> void:
	pass # Replace with function body.


#@onready var main_charicter = %main_charicter
@onready var game_manager = %game_manager





func _process(_delta: float) -> void:
	pass


func refresh():
	pass

#func _on_hitbox_component_body_entered(body: Node2D) -> void:
	
	#print("the ", body.name, " is touching me!")
	#if (body.name == "CharacterBody2D"):
		##var y_delta = position.y - body.position.y
		##print("y_delta ", y_delta)
		##if (y_delta > 1000): 
			#health_component.take_damage(10)
			#game_manager.add_points(0)
		##else:
			#get_tree().reload_current_scene()


func _on_health_component_health_is_zero() -> void:
	print("ENEMY DIED")
	queue_free()
	pass # Replace with function body.
