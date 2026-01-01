extends RigidBody2D


func _ready() -> void:
	pass # Replace with function body.


#@onready var main_charicter = %main_charicter
@onready var game_manager = %game_manager





func _process(_delta: float) -> void:
	pass
# dad added this

func _on_area_2d_body_entered(body: Node2D) -> void:
	if (body.name == "CharacterBody2D"):
		var y_delta = position.y - body.position.y
		

		if (y_delta >15): 
			queue_free()
			game_manager.add_points(0)
		else:
			
			get_tree().reload_current_scene()
