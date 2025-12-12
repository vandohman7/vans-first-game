extends Area2D

@onready var game_manager = %game_manager
#
#
#
func _on_body_entered(body: Node2D) -> void:
	if (body.name == "CharacterBody2D"):
		game_manager.add_points(5)
		queue_free()
