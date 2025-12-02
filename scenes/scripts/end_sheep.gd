extends Area2D

@onready var game_manager = %game_manager

func _on_body_entered(body: Node2D) -> void:
	if (body.name == "CharacterBody2D"):
		if game_manager.points > 14:
			get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
		else:
			print ("not enoungh points")
			
			
