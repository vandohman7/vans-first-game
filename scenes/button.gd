extends Button

func _ready() -> void:
	grab_focus()





func _process(_delta: float) -> void:
	pass


func _load_scene(scene: String) -> void:
	print(scene + " Loading!")
	get_tree().change_scene_to_file("res://scenes/" + scene)
