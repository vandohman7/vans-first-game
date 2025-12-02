extends Control


@onready var pause_menu: Control = $"."

#@onready var visiblity = pause_menu.get_node("visible")

func _process(delta):
	print("_process")
	testtab()
	
func resume():
	print("resume")
	get_tree().paused = false

func pause():
	print("pause")
	get_tree().paused = true

func isPaused():
	return get_tree().paused == true

func testtab():
	if Input.is_action_just_pressed("esc") and !isPaused():
		pause()
	elif Input.is_action_just_pressed("esc") and isPaused():
		resume()
		
	visible = isPaused()


func _on_resume_pressed():
	resume()


func _on_restart_pressed():
	resume()
	get_tree().reload_current_scene()


func _on_quit_pressed():
	get_tree().quit()
