extends Node


func _ready():
	pass
	
	
	
func _process(_delta: float) -> void:
	pass


func _load_scene(scene: String) -> void:
	print(scene + " Loading!")
	get_tree().change_scene_to_file("res://scenes/" + scene)

func _on_tutorial_pressed() -> void:
	_load_scene("tutorial.tscn")
	
func _on_level_1_pressed() -> void:
	_load_scene("level 1.tscn")

func _on_level_2_pressed() -> void:
	_load_scene("level 2.tscn")

func _on_level_3_pressed() -> void:
	_load_scene("level 3.tscn")

func _on_level_4_pressed() -> void:
	_load_scene("level 4.tscn")

func _on_level_5_pressed() -> void:
	_load_scene("level 5.tscn")


func _on_level_6_pressed() -> void:
	_load_scene("level 6.tscn")


func _on_main_menu_pressed() -> void:
	_load_scene("main_menu.tscn")


func _on_credets_pressed() -> void:
	_load_scene("credets.tscn")
