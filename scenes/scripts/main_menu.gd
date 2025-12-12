extends Node


func _ready():
	pass
	
	
	
func _process(_delta: float) -> void:
	pass

func _on_level_1_pressed() -> void:
	print("main.tscn")
	get_tree().change_scene_to_file("res://scenes/level 1.tscn")


func _on_level_2_pressed() -> void:
	print(" level 2.tscn")
	get_tree().change_scene_to_file("res://scenes/level 2.tscn")







func _on_tutorial_pressed() -> void:
	print("tutorial.tscn")
	get_tree().change_scene_to_file("res://scenes/tutorial.tscn")






func _on_level_3_pressed() -> void:
	print("level 3 tscn")
	get_tree().change_scene_to_file("res://scenes/level 3.tscn")




func _on_level_4_pressed() -> void:
	print("level 4 tscn")
	get_tree().change_scene_to_file("res://scenes/level 4.tscn")
