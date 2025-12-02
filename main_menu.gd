extends Node



func _on_level_1_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main.tscn")


func _on_level_2_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level 2.tscn")


func _on_tutorial_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/tutorial.tscn")
